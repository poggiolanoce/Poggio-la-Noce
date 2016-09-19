<?php
namespace Craft;

use Commerce\Helpers\CommerceDbHelper;

/**
 * Discount service.
 *
 * @author    Pixel & Tonic, Inc. <support@pixelandtonic.com>
 * @copyright Copyright (c) 2015, Pixel & Tonic, Inc.
 * @license   https://craftcommerce.com/license Craft Commerce License Agreement
 * @see       https://craftcommerce.com
 * @package   craft.plugins.commerce.services
 * @since     1.0
 */
class Commerce_DiscountsService extends BaseApplicationComponent
{
    /**
     * @param int $id
     *
     * @return Commerce_DiscountModel|null
     */
    public function getDiscountById($id)
    {
        $result = Commerce_DiscountRecord::model()->findById($id);

        if ($result) {
            return Commerce_DiscountModel::populateModel($result);
        }

        return null;
    }

    /**
     * Getting all discounts applicable for the current user and given items
     * list
     *
     * @param Commerce_LineItemModel[] $lineItems
     *
     * @return Commerce_DiscountModel[]
     */
    public function getDiscountsForItems(array $lineItems)
    {
        //getting ids lists
        $productIds = [];
        $productTypeIds = [];
        foreach ($lineItems as $item) {
            $productIds[] = $item->purchasable->productId;
            $productTypeIds[] = $item->purchasable->product->typeId;
        }
        $productTypeIds = array_unique($productTypeIds);

        $groupIds = $this->getCurrentUserGroupIds();

        //building criteria
        $criteria = new \CDbCriteria();
        $criteria->group = 't.id';
        $criteria->addCondition('t.enabled = 1');
        $criteria->addCondition('t.dateFrom IS NULL OR t.dateFrom <= NOW()');
        $criteria->addCondition('t.dateTo IS NULL OR t.dateTo >= NOW()');

        $criteria->join = 'LEFT JOIN {{' . Commerce_DiscountProductRecord::model()->getTableName() . '}} dp ON dp.discountId = t.id ';
        $criteria->join .= 'LEFT JOIN {{' . Commerce_DiscountProductTypeRecord::model()->getTableName() . '}} dpt ON dpt.discountId = t.id ';
        $criteria->join .= 'LEFT JOIN {{' . Commerce_DiscountUserGroupRecord::model()->getTableName() . '}} dug ON dug.discountId = t.id ';

        if ($productIds) {
            $list = implode(',', $productIds);
            $criteria->addCondition("dp.productId IN ($list) OR t.allProducts = 1");
        } else {
            $criteria->addCondition("t.allProducts = 1");
        }

        if ($productTypeIds) {
            $list = implode(',', $productTypeIds);
            $criteria->addCondition("dpt.productTypeId IN ($list) OR t.allProductTypes = 1");
        } else {
            $criteria->addCondition("t.allProductTypes = 1");
        }

        if ($groupIds) {
            $list = implode(',', $groupIds);
            $criteria->addCondition("dug.userGroupId IN ($list) OR t.allGroups = 1");
        } else {
            $criteria->addCondition("t.allGroups = 1");
        }

        //searching
        return $this->getAllDiscounts($criteria);
    }

    /**
     * @return array
     */
    public function getCurrentUserGroupIds()
    {
        $groupIds = [];
        $user = craft()->userSession->getUser();
        if ($user) {
            foreach ($user->getGroups() as $group) {
                $groupIds[] = $group->id;
            }

            return $groupIds;
        }

        return $groupIds;
    }

    /**
     * @param array|\CDbCriteria $criteria
     *
     * @return Commerce_DiscountModel[]
     */
    public function getAllDiscounts($criteria = [])
    {
        $records = Commerce_DiscountRecord::model()->findAll($criteria);

        return Commerce_DiscountModel::populateModels($records);
    }

    /**
     * Get discount by code and check it's active and applies to the current
     * user
     *
     * @param int $code
     * @param int $customerId
     * @param string $error
     *
     * @return true
     */
    public function matchCode($code, $customerId, &$error = '')
    {

        $model = $this->getDiscountByCode($code);
        if (!$model) {
            $error = Craft::t('Coupon not valid');

            return false;
        }

        if (!$model->enabled) {
            $error = Craft::t('Discount is not available');

            return false;
        }

        if ($model->totalUseLimit > 0 && $model->totalUses >= $model->totalUseLimit) {
            $error = Craft::t('Discount use has reached it’s limit');

            return false;
        }

        $now = new DateTime();
        if ($model->dateFrom && $model > $now || $model->dateTo && $model->dateTo < $now) {
            $error = Craft::t('Discount is out of date');

            return false;
        }

        $groupIds = $this->getCurrentUserGroupIds();
        if (!$model->allGroups && !array_intersect($groupIds,
                $model->getGroupIds())
        ) {
            $error = Craft::t('Discount is not allowed for the current user');

            return false;
        }

	    if ($customerId)
	    {
		    // The 'Per User Limit' can only be tracked against logged in users since guest customers are re-generated often
		    if ($model->perUserLimit > 0 && !craft()->userSession->isLoggedIn())
		    {
			    $error = Craft::t('Discount is limited to use by logged in users only.');
			    
			    return false;
		    }

            $uses = Commerce_CustomerDiscountUseRecord::model()->findByAttributes([
                'customerId' => $customerId,
                'discountId' => $model->id
            ]);
            if ($uses && $uses->uses >= $model->perUserLimit) {
                $error = Craft::t('You can not use this discount anymore');

                return false;
            }
        }

	    if ($model->perEmailLimit > 0)
	    {
		    $cart = craft()->commerce_cart->getCart();
		    $email = $cart->email;

		    if ($email)
		    {
			    $previousOrders = craft()->commerce_orders->getOrdersByEmail($email);

			    $usedCount = 0;
			    foreach ($previousOrders as $order)
			    {
				    if ($order->couponCode == $code)
				    {
					    $usedCount = $usedCount + 1;
				    }
			    }

			    if ($usedCount >= $model->perEmailLimit)
			    {
				    $error = Craft::t('This coupon limited to '.$model->perEmailLimit.' uses.');

				    return false;
			    }
		    }
	    }


        return true;
    }

    /**
     * @param string $code
     *
     * @return Commerce_DiscountModel|null
     */
    public function getDiscountByCode($code)
    {
        $result = Commerce_DiscountRecord::model()->findByAttributes(['code' => $code]);

        if ($result) {
            return Commerce_DiscountModel::populateModel($result);
        }

        return null;
    }

    /**
     * @param Commerce_LineItemModel $lineItem
     * @param Commerce_DiscountModel $discount
     *
     * @return bool
     */
    public function matchLineItem(
        Commerce_LineItemModel $lineItem,
        Commerce_DiscountModel $discount
    )
    {

        if ($lineItem->onSale && $discount->excludeOnSale) {
            return false;
        }

        // can't match something not promotable
        if (!$lineItem->purchasable->getIsPromotable()) {
            return false;
        }

        if ($discount->getProductIds()) {
            if ($lineItem->purchasable instanceof Commerce_VariantModel) {
                $productId = $lineItem->purchasable->productId;
                if (!$discount->allProducts && !in_array($productId,
                        $discount->getProductIds())
                ) {
                    return false;
                }
            } else {
                return false;
            }
        }


        if ($discount->getProductTypeIds()) {
            if ($lineItem->purchasable instanceof Commerce_VariantModel) {
                $productTypeId = $lineItem->purchasable->product->typeId;
                if (!$discount->allProductTypes && !in_array($productTypeId,
                        $discount->getProductTypeIds())
                ) {
                    return false;
                }
            } else {
                return false;
            }
        }

        $userGroups = $this->getCurrentUserGroupIds();
        if (!$discount->allGroups && !array_intersect($userGroups,
                $discount->getGroupIds())
        ) {
            return false;
        }

	    //raising event
	    $event = new Event($this, [
		    'lineItem' => $lineItem,
		    'discount' => $discount
	    ]);
	    $this->onBeforeMatchLineItem($event);

	    if(!$event->performAction){
		    return false;
	    }

        return true;
    }

    /**
     * @param Commerce_DiscountModel $model
     * @param array $groups ids
     * @param array $productTypes ids
     * @param array $products ids
     *
     * @return bool
     * @throws \Exception
     */
    public function saveDiscount(
        Commerce_DiscountModel $model,
        array $groups,
        array $productTypes,
        array $products
    )
    {
        if ($model->id) {
            $record = Commerce_DiscountRecord::model()->findById($model->id);

            if (!$record) {
                throw new Exception(Craft::t('No discount exists with the ID “{id}”',
                    ['id' => $model->id]));
            }
        } else {
            $record = new Commerce_DiscountRecord();
        }

        $fields = [
            'id',
            'name',
            'description',
            'dateFrom',
            'dateTo',
            'enabled',
            'purchaseTotal',
            'purchaseQty',
            'baseDiscount',
            'perItemDiscount',
            'percentDiscount',
            'freeShipping',
            'excludeOnSale',
            'perUserLimit',
            'perEmailLimit',
            'totalUseLimit'
        ];
        foreach ($fields as $field) {
            $record->$field = $model->$field;
        }

        $record->code = $model->code ?: null;

        $record->allGroups = $model->allGroups = empty($groups);
        $record->allProductTypes = $model->allProductTypes = empty($productTypes);
        $record->allProducts = $model->allProducts = empty($products);

        $record->validate();
        $model->addErrors($record->getErrors());

        CommerceDbHelper::beginStackedTransaction();
        try {
            if (!$model->hasErrors()) {
                $record->save(false);
                $model->id = $record->id;

                Commerce_DiscountUserGroupRecord::model()->deleteAllByAttributes(['discountId' => $model->id]);
                Commerce_DiscountProductRecord::model()->deleteAllByAttributes(['discountId' => $model->id]);
                Commerce_DiscountProductTypeRecord::model()->deleteAllByAttributes(['discountId' => $model->id]);

                foreach ($groups as $groupId) {
                    $relation = new Commerce_DiscountUserGroupRecord;
                    $relation->attributes = [
                        'userGroupId' => $groupId,
                        'discountId' => $model->id
                    ];
                    $relation->insert();
                }

                foreach ($productTypes as $productTypeId) {
                    $relation = new Commerce_DiscountProductTypeRecord;
                    $relation->attributes = [
                        'productTypeId' => $productTypeId,
                        'discountId' => $model->id
                    ];
                    $relation->insert();
                }

                foreach ($products as $productId) {
                    $relation = new Commerce_DiscountProductRecord;
                    $relation->attributes = [
                        'productId' => $productId,
                        'discountId' => $model->id
                    ];
                    $relation->insert();
                }

                CommerceDbHelper::commitStackedTransaction();

                return true;
            }
        } catch (\Exception $e) {
            CommerceDbHelper::rollbackStackedTransaction();
            throw $e;
        }

        CommerceDbHelper::rollbackStackedTransaction();

        return false;
    }

    /**
     * @param int $id
     */
    public function deleteDiscountById($id)
    {
        Commerce_DiscountRecord::model()->deleteByPk($id);
    }

	public function clearCouponUsageHistory($id)
	{
		$discount = $this->getDiscountById($id);

		if ($discount)
		{
			Commerce_CustomerDiscountUseRecord::model()->deleteAllByAttributes(['discountId' => $discount->id]);

			if ($discount->code)
			{
				$discount = Commerce_DiscountRecord::model()->findByAttributes(['code' => $discount->code]);

				if ($discount)
				{
					$discount->totalUses = 0;
					$discount->save();
				}
			}
		}
	}

    /**
     * Update discount uses counters
     *
     * @param Event $event
     */
    public function orderCompleteHandler(Event $event)
    {
        /** @var Commerce_OrderModel $order */
        $order = $event->params['order'];

        if (!$order->couponCode) {
            return;
        }

        /** @var Commerce_DiscountRecord $record */
        $record = Commerce_DiscountRecord::model()->findByAttributes(['code' => $order->couponCode]);
        if (!$record || !$record->id) {
            return;
        }

        if ($record->totalUseLimit) {
            $record->saveCounters(['totalUses' => 1]);
        }

        if ($record->perUserLimit && $order->customerId) {

            $customerDiscountUseRecord = Commerce_CustomerDiscountUseRecord::model()->findByAttributes([
                'customerId' => $order->customerId,
                'discountId' => $record->id
            ]);

            if (!$customerDiscountUseRecord) {
                $customerDiscountUseRecord = new Commerce_CustomerDiscountUseRecord();
                $customerDiscountUseRecord->customerId = $order->customerId;
                $customerDiscountUseRecord->discountId = $record->id;
                $customerDiscountUseRecord->uses = 1;
                $customerDiscountUseRecord->save();
            }else{
                $customerDiscountUseRecord->saveCounters(['uses' => 1]);
            }
        }
    }

    /**
     * Before matching a lineitem
     * Event params: addres(Commerce_AddressModel)
     *
     * @param \CEvent $event
     *
     * @throws \CException
     */
    public function onBeforeMatchLineItem(\CEvent $event)
    {
        $params = $event->params;
        if (empty($params['lineItem']) || !($params['lineItem'] instanceof Commerce_LineItemModel)) {
            throw new Exception('onBeforeMatchLineItem event requires "lineItem" param with Commerce_LineItemModel instance');
        }

        if (empty($params['discount']) || !($params['discount'] instanceof Commerce_DiscountModel)) {
            throw new Exception('onBeforeMatchLineItem event requires "discount" param with Commerce_DiscountModel instance');
        }

        $this->raiseEvent('onBeforeMatchLineItem', $event);
    }

}
