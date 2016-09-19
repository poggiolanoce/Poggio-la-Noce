<?php
namespace Craft;

use Omnipay\Common\Exception\OmnipayException;

/**
 * Class Commerce_TransactionModel
 *
 * @package   Craft
 *
 * @property int $id
 * @property string $hash
 * @property string $type
 * @property float $amount
 * @property string $status
 * @property string $reference
 * @property string $message
 * @property string $response
 *
 * @property int $parentId
 * @property int $userId
 * @property int $paymentMethodId
 * @property int $orderId
 *
 * @property Commerce_TransactionModel $parent
 * @property Commerce_PaymentMethodModel $paymentMethod
 * @property Commerce_OrderModel $order
 * @property UserModel $user
 *
 * @author    Pixel & Tonic, Inc. <support@pixelandtonic.com>
 * @copyright Copyright (c) 2015, Pixel & Tonic, Inc.
 * @license   https://craftcommerce.com/license Craft Commerce License Agreement
 * @see       https://craftcommerce.com
 * @package   craft.plugins.commerce.models
 * @since     1.0
 */
class Commerce_TransactionModel extends BaseModel
{
    /**
     * @param null $attributes
     */
    public function __construct($attributes = null)
    {
        // generate unique hash
        $this->hash = md5(uniqid(mt_rand(), true));

        parent::__construct($attributes);
    }

    /**
     * @return bool
     */
    public function canCapture()
    {
        // can only capture authorize payments
        if ($this->type != Commerce_TransactionRecord::TYPE_AUTHORIZE || $this->status != Commerce_TransactionRecord::STATUS_SUCCESS) {
            return false;
        }

        // check gateway supports capture
        try {
            $gateway = $this->paymentMethod->getGateway();
            if (!$gateway || !$gateway->supportsCapture()) {
                return false;
            }
        } catch (OmnipayException  $e) {
            return false;
        }

        // check transaction hasn't already been captured
        $criteria = [
            'condition' => 'type = ? AND status = ? AND orderId = ?',
            'params' => [
                Commerce_TransactionRecord::TYPE_CAPTURE,
                Commerce_TransactionRecord::STATUS_SUCCESS,
                $this->orderId
            ],
        ];
        $exists = craft()->commerce_transactions->transactionExists($criteria);

        return !$exists;
    }

    /**
     * @return bool
     */
    public function canRefund()
    {
        // can only refund purchase or capture transactions
        if (!in_array($this->type, [
                Commerce_TransactionRecord::TYPE_PURCHASE,
                Commerce_TransactionRecord::TYPE_CAPTURE
            ]) || $this->status != Commerce_TransactionRecord::STATUS_SUCCESS
        ) {
            return false;
        }

        // check gateway supports refund
        try {
            $gateway = $this->paymentMethod->getGateway();
            if (!$gateway || !$gateway->supportsRefund()) {
                return false;
            }
        } catch (OmnipayException $e) {
            return false;
        }

        // check transaction hasn't already been refunded
        $criteria = [
            'condition' => 'type = ? AND status = ? AND orderId = ?',
            'params' => [
                Commerce_TransactionRecord::TYPE_REFUND,
                Commerce_TransactionRecord::STATUS_SUCCESS,
                $this->orderId
            ],
        ];
        $exists = craft()->commerce_transactions->transactionExists($criteria);

        return !$exists;
    }

    /**
     * @return Commerce_TransactionModel|null
     */
    public function getParent()
    {
        return craft()->commerce_transactions->getTransactionById($this->parentId);
    }

    /**
     * @return Commerce_OrderModel|null
     */
    public function getOrder()
    {
        return craft()->commerce_orders->getOrderById($this->orderId);
    }

    /**
     * @return Commerce_PaymentMethodModel|null
     */
    public function getPaymentMethod()
    {
        return craft()->commerce_paymentMethods->getPaymentMethodById($this->paymentMethodId);
    }


    /**
     * @return array
     */
    protected function defineAttributes()
    {
        return [
            'id' => AttributeType::Number,
            'orderId' => AttributeType::Number,
            'parentId' => AttributeType::Number,
            'userId' => AttributeType::Number,
            'hash' => AttributeType::String,
            'paymentMethodId' => AttributeType::Number,
            'type' => AttributeType::String,
            'amount' => AttributeType::Number,
            'status' => AttributeType::String,
            'reference' => AttributeType::String,
            'message' => AttributeType::String,
            'response' => AttributeType::String,
            'dateUpdated' => AttributeType::String,
        ];
    }
}
