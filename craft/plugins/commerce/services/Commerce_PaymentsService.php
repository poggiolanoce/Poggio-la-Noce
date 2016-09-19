<?php
namespace Craft;

use Commerce\Gateways\PaymentFormModels\BasePaymentFormModel;
use Omnipay\Common\CreditCard;
use Omnipay\Common\ItemBag;
use Omnipay\Common\Message\AbstractRequest;
use Omnipay\Common\Message\ResponseInterface;

/**
 * Payments service.
 *
 * @author    Pixel & Tonic, Inc. <support@pixelandtonic.com>
 * @copyright Copyright (c) 2015, Pixel & Tonic, Inc.
 * @license   https://craftcommerce.com/license Craft Commerce License Agreement
 * @see       https://craftcommerce.com
 * @package   craft.plugins.commerce.services
 * @since     1.0
 */
class Commerce_PaymentsService extends BaseApplicationComponent
{
	/**
	 * @param Commerce_OrderModel  $order
	 * @param BasePaymentFormModel $form
	 * @param string|null          &$redirect
	 * @param string|null          &$customError
	 *
	 * @return bool
	 * @throws Exception
	 * @throws \Exception
	 */
	public function processPayment(
		Commerce_OrderModel $order,
		BasePaymentFormModel $form,
		&$redirect = null,
		&$customError = null
	)
	{
		// Order could have zero totalPrice and already considered 'paid'. Free orders complete immediately.
		if ($order->isPaid())
		{
			if (!$order->datePaid)
			{
				$order->datePaid = DateTimeHelper::currentTimeForDb();
			}

			if (!$order->isCompleted)
			{
				craft()->commerce_orders->completeOrder($order);
			}

			return true;
		}

		//choosing default action
		$defaultAction = $order->paymentMethod->paymentType;
		$defaultAction = ($defaultAction === Commerce_TransactionRecord::TYPE_PURCHASE) ? $defaultAction : Commerce_TransactionRecord::TYPE_AUTHORIZE;
		$gateway = $order->paymentMethod->getGateway();

		if ($defaultAction == Commerce_TransactionRecord::TYPE_AUTHORIZE)
		{
			if (!$gateway->supportsAuthorize())
			{
				$customError = Craft::t("Gateway doesn’t support authorize");

				return false;
			}
		}
		else
		{
			if (!$gateway->supportsPurchase())
			{
				$customError = Craft::t("Gateway doesn’t support purchase");

				return false;
			}
		}

		//creating order, transaction and request
		$transaction = craft()->commerce_transactions->createTransaction($order);
		$transaction->type = $defaultAction;
		$this->saveTransaction($transaction);

		$card = $this->createCard($order, $form);

		$itemBag = $this->createItemBag($order);

		$request = $gateway->$defaultAction($this->buildPaymentRequest($transaction, $card, $itemBag));

		// Let the payment methods gateway adapter do anything else to the request
		// including populating the request with things other than the card data.
		$order->paymentMethod->populateRequest($request, $form);

		try
		{
			$success = $this->sendPaymentRequest($order, $request, $transaction, $redirect, $customError);

			if ($success)
			{
				craft()->commerce_orders->updateOrderPaidTotal($order);
			}
		}
		catch (\Exception $e)
		{
			$success = false;
			$customError = $e->getMessage();
		}

		return $success;
	}

	/**
	 * @param Commerce_TransactionModel $child
	 *
	 * @throws Exception
	 */
	private function saveTransaction($child)
	{
		if (!craft()->commerce_transactions->saveTransaction($child))
		{
			throw new Exception(Craft::t('Error saving transaction: ').implode(', ',
					$child->getAllErrors()));
		}
	}

	private function createItemBag(Commerce_OrderModel $order)
	{

		if (!craft()->config->get('sendCartInfoToGateways', 'commerce'))
		{
			return null;
		}

		$items = $order->getPaymentMethod()->getGatewayAdapter()->createItemBag();
		$currency = \Omnipay\Common\Currency::find($order->currency);

		$priceCheck = 0;

		$count = -1;
		/** @var Commerce_LineItemModel $item */
		foreach ($order->lineItems as $item)
		{
			$price = round($item->salePrice, $currency->getDecimals());
			// Can not accept zero amount items. See item (4) here:
			// https://developer.paypal.com/docs/classic/express-checkout/integration-guide/ECCustomizing/#setting-order-details-on-the-paypal-review-page
			if ($price != 0)
			{
				$count++;
				$purchasable = $item->getPurchasable();
				$defaultDescription = Craft::t('Item ID')." ".$item->id;
				$purchasableDescription = $purchasable ? $purchasable->getDescription() : $defaultDescription;
				$description = isset($item->snapshot['description']) ? $item->snapshot['description'] : $purchasableDescription;
				$description = empty($description) ? "Item ".$count : $description;
				$items->add([
					'name'        => $description,
					'description' => $description,
					'quantity'    => $item->qty,
					'price'       => $price,
				]);
				$priceCheck = $priceCheck + ($item->qty * $item->salePrice);
			}
		}

		$count = -1;
		/** @var Commerce_OrderAdjustmentModel $adjustment */
		foreach ($order->adjustments as $adjustment)
		{
			$price = round($adjustment->amount, $currency->getDecimals());

			// Do not include the 'included' adjustments, and do not send zero value items
			// See item (4) https://developer.paypal.com/docs/classic/express-checkout/integration-guide/ECCustomizing/#setting-order-details-on-the-paypal-review-page
			if (($adjustment->included == 0 || $adjustment->included == false) && $price != 0)
			{
				$count++;
				$items->add([
					'name'        => empty($adjustment->name) ? $adjustment->type." ".$count : $adjustment->name,
					'description' => empty($adjustment->description) ? $adjustment->type." ".$count : $adjustment->description,
					'quantity'    => 1,
					'price'       => $price,
				]);
				$priceCheck = $priceCheck + $adjustment->amount;
			}
		}

		$priceCheck = round($priceCheck, $currency->getDecimals());
		$totalPrice = round($order->totalPrice, $currency->getDecimals());
		$same = (bool)($priceCheck == $totalPrice);

		if (!$same)
		{
			CommercePlugin::log('Item bag total price does not equal the orders totalPrice, some payment gateways will complain.', LogLevel::Warning, true);
		}

		return $items;
	}

	/**
	 * @param Commerce_OrderModel $order
	 * @param                     $paymentForm
	 *
	 * @return CreditCard
	 */
	private function createCard(
		Commerce_OrderModel $order,
		$paymentForm
	)
	{
		$card = new CreditCard;

		$order->paymentMethod->populateCard($card, $paymentForm);

		if ($order->billingAddressId)
		{
			$billingAddress = $order->billingAddress;
			if ($billingAddress)
			{
				// Set top level names to the billing names
				$card->setFirstName($billingAddress->firstName);
				$card->setLastName($billingAddress->lastName);

				$card->setBillingFirstName($billingAddress->firstName);
				$card->setBillingLastName($billingAddress->lastName);
				$card->setBillingAddress1($billingAddress->address1);
				$card->setBillingAddress2($billingAddress->address2);
				$card->setBillingCity($billingAddress->city);
				$card->setBillingPostcode($billingAddress->zipCode);
				if ($billingAddress->getCountry())
				{
					$card->setBillingCountry($billingAddress->getCountry()->iso);
				}
				$card->setBillingState($billingAddress->getStateText());
				$card->setBillingPhone($billingAddress->phone);
				$card->setBillingCompany($billingAddress->businessName);
				$card->setCompany($billingAddress->businessName);
			}
		}

		if ($order->shippingAddressId)
		{
			$shippingAddress = $order->shippingAddress;
			if ($shippingAddress)
			{
				$card->setShippingFirstName($shippingAddress->firstName);
				$card->setShippingLastName($shippingAddress->lastName);
				$card->setShippingAddress1($shippingAddress->address1);
				$card->setShippingAddress2($shippingAddress->address2);
				$card->setShippingCity($shippingAddress->city);
				$card->setShippingPostcode($shippingAddress->zipCode);
				if ($shippingAddress->getCountry())
				{
					$card->setShippingCountry($shippingAddress->getCountry()->iso);
				}
				$card->setShippingState($shippingAddress->getStateText());
				$card->setShippingPhone($shippingAddress->phone);
				$card->setShippingCompany($shippingAddress->businessName);
			}
		}

		$card->setEmail($order->email);

		return $card;
	}

	/**
	 * @param Commerce_TransactionModel $transaction
	 * @param CreditCard                $card
	 * @param ItemBag                   $itemBag
	 *
	 * @return array
	 */
	private function buildPaymentRequest(
		Commerce_TransactionModel $transaction,
		CreditCard $card = null,
		ItemBag $itemBag = null
	)
	{
		$request = [
			'amount'               => $transaction->amount,
			'currency'             => craft()->commerce_settings->getOption('defaultCurrency'),
			'transactionId'        => $transaction->id,
			'description'          => Craft::t('Order').' #'.$transaction->orderId,
			'clientIp'             => craft()->request->getIpAddress(),
			'transactionReference' => $transaction->hash,
			'returnUrl'            => UrlHelper::getActionUrl('commerce/payments/completePayment',
				['commerceTransactionId' => $transaction->id, 'commerceTransactionHash' => $transaction->hash]),
			'cancelUrl'            => UrlHelper::getSiteUrl($transaction->order->cancelUrl),
		];

		$request['notifyUrl'] = $request['returnUrl'];

		// Do not use IPv6 loopback
		if ($request['clientIp'] == "::1")
		{
			$request['clientIp'] = '127.0.0.1';
		}


		// custom gateways may wish to access the order directly
		$request['order'] = $transaction->order;
		$request['orderId'] = $transaction->order->id;

		// Paypal only params
		$request['noShipping'] = 1;
		$request['allowNote'] = 0;
		$request['addressOverride'] = 1;

		if ($card)
		{
			$request['card'] = $card;
		}

		if ($itemBag)
		{
			$request['items'] = $itemBag;
		}

		$pluginRequest = craft()->plugins->callFirst('commerce_modifyPaymentRequest', [$request]);

		if ($pluginRequest)
		{
			$request = array_merge($request, $pluginRequest);
		}

		return $request;
	}

	/**
	 * Send a payment request to the gateway, and redirect appropriately
	 *
	 * @param Commerce_OrderModel       $order
	 * @param AbstractRequest           $request
	 * @param Commerce_TransactionModel $transaction
	 * @param string|null               &$redirect
	 * @param string                    &$customError
	 *
	 * @return bool
	 */
	private function sendPaymentRequest(
		Commerce_OrderModel $order,
		AbstractRequest $request,
		Commerce_TransactionModel $transaction,
		&$redirect = null,
		&$customError = null
	)
	{

		//raising event
		$event = new Event($this, [
			'type'        => $transaction->type,
			'request'     => $request,
			'transaction' => $transaction
		]);
		$this->onBeforeGatewayRequestSend($event);

		if (!$event->performAction)
		{
			$transaction->status = Commerce_TransactionRecord::STATUS_FAILED;
			$this->saveTransaction($transaction);
		}

		if ($event->performAction)
		{
			try
			{

				$response = $this->_sendRequest($request, $transaction);

				$this->updateTransaction($transaction, $response);

				if ($response->isRedirect())
				{
					// redirect to off-site gateway
					if ($response->getRedirectMethod() == 'GET')
					{
						$redirect = $response->getRedirectUrl();
					}
					else
					{

						$gatewayPostRedirectTemplate = craft()->config->get('gatewayPostRedirectTemplate', 'commerce');

						if (!empty($gatewayPostRedirectTemplate))
						{
							$variables = [];
							$hiddenFields = '';

							// Gather all post hidden data inputs.
							foreach ($response->getRedirectData() as $key => $value)
							{
								$hiddenFields .= sprintf(
										'<input type="hidden" name="%1$s" value="%2$s" />',
										htmlentities($key, ENT_QUOTES, 'UTF-8', false),
										htmlentities($value, ENT_QUOTES, 'UTF-8', false)
									)."\n";
							}
							$variables['inputs'] = $hiddenFields;

							// Set the action url to the responses redirect url
							$variables['actionUrl'] = $response->getRedirectUrl();

							// Set Craft to the site template mode
							$templatesService = craft()->templates;
							$oldTemplateMode = $templatesService->getTemplateMode();
							$templatesService->setTemplateMode(TemplateMode::Site);

							$template = $templatesService->render($gatewayPostRedirectTemplate, $variables);

							// Restore the original template mode
							$templatesService->setTemplateMode($oldTemplateMode);

							// Send the template back to the user.
							ob_start();
							echo $template;
							craft()->end();
						}

						// If the developer did not provide a gatewayPostRedirectTemplate, use the built in Omnipay Post html form.
						$response->redirect();
					}

					return true;
				}

				// Exception required for SagePay Server
				if ($transaction->paymentMethod->getGatewayAdapter()->handle() == "SagePay_Server" && method_exists($response, 'confirm'))
				{
					$url = UrlHelper::getActionUrl('commerce/payments/completePayment', ['commerceTransactionId' => $transaction->id, 'commerceTransactionHash' => $transaction->hash]);
					$message = "Status=OK\r\nRedirectUrl=".$url."\r\nStatusDetail=OK";
					ob_start();
					echo $message;
					exit(200);
				}

			}
			catch (\Exception $e)
			{
				$transaction->status = Commerce_TransactionRecord::STATUS_FAILED;
				$transaction->message = $e->getMessage();
				CommercePlugin::log("Omnipay Gateway Communication Error: ".$e->getMessage());
				$this->saveTransaction($transaction);

				// Exception required for SagePay Server
				if ($transaction->paymentMethod->getGatewayAdapter()->handle() == "SagePay_Server")
				{
					$url = UrlHelper::getSiteUrl($order->cancelUrl);
					$message = "Status=INVALID\r\nRedirectUrl=".$url."\r\nStatusDetail=".$e->getMessage();
					ob_start();
					echo $message;
					exit(200);
				}

			}
		}

		// For gateways that call us directly and usually do not like redirects.
		// TODO: Move this into the gateway adapter interface.
		$gateways = array(
			'AuthorizeNet_SIM',
			'Realex_Redirect',
			'SecurePay_DirectPost',
			'WorldPay',
		);

		if (in_array($transaction->paymentMethod->getGatewayAdapter()->handle(), $gateways)) {

			$url = UrlHelper::getActionUrl('commerce/payments/completePayment', ['commerceTransactionId' => $transaction->id, 'commerceTransactionHash' => $transaction->hash]);
			$url = htmlspecialchars($url, ENT_QUOTES);

			$template = <<<EOF
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="refresh" content="1;URL=$url" />
    <title>Redirecting...</title>
</head>
<body onload="document.payment.submit();">
    <p>Please wait while we redirect you back...</p>
    <form name="payment" action="$url" method="post">
        <p><input type="submit" value="Continue" /></p>
    </form>
</body>
</html>
EOF;
			ob_start();
			echo $template;
			craft()->end();

		}

		if ($transaction->status == Commerce_TransactionRecord::STATUS_SUCCESS)
		{
			return true;
		}
		else
		{
			$customError = $transaction->message;

			return false;
		}
	}

	/**
	 * Event: before sending a payment request to the gateway
	 * Event params: type(string)
	 *               request(AbstractRequest)
	 *               transaction(Commerce_TransactionModel)
	 *
	 * @param \CEvent $event
	 *
	 * @throws \CException
	 */
	public function onBeforeGatewayRequestSend(\CEvent $event)
	{
		$params = $event->params;

		if (empty($params['type']))
		{
			throw new Exception('onBeforeGatewayRequestSend event requires "type" param');
		}

		if (empty($params['request']) || !($params['request'] instanceof AbstractRequest))
		{
			throw new Exception('onBeforeGatewayRequestSend event requires "request" param as AbstractRequest');
		}

		if (empty($params['transaction']) || !($params['transaction'] instanceof Commerce_TransactionModel))
		{
			throw new Exception('onBeforeGatewayRequestSend event requires "request" param as AbstractRequest');
		}

		$this->raiseEvent('onBeforeGatewayRequestSend', $event);
	}

	/**
	 * @param Commerce_TransactionModel $transaction
	 * @param ResponseInterface         $response
	 *
	 * @throws Exception
	 */
	private function updateTransaction(
		Commerce_TransactionModel $transaction,
		ResponseInterface $response
	)
	{
		if ($response->isSuccessful())
		{
			$transaction->status = Commerce_TransactionRecord::STATUS_SUCCESS;
		}
		elseif ($response->isRedirect())
		{
			$transaction->status = Commerce_TransactionRecord::STATUS_REDIRECT;
		}
		else
		{
			$transaction->status = Commerce_TransactionRecord::STATUS_FAILED;
		}

		$transaction->reference = $response->getTransactionReference();
		$transaction->message = $response->getMessage();

		if ($response->isSuccessful())
		{
			craft()->commerce_orders->updateOrderPaidTotal($transaction->order);
		}

		$this->saveTransaction($transaction);
	}

	/**
	 * @param Commerce_TransactionModel $transaction
	 *
	 * @return Commerce_TransactionModel
	 */
	public function captureTransaction(Commerce_TransactionModel $transaction)
	{
		return $this->processCaptureOrRefund($transaction,
			Commerce_TransactionRecord::TYPE_CAPTURE);
	}

	/**
	 * @param Commerce_TransactionModel $parent
	 * @param string                    $action
	 *
	 * @return Commerce_TransactionModel
	 * @throws Exception
	 */
	private function processCaptureOrRefund(
		Commerce_TransactionModel $parent,
		$action
	)
	{
		if (!in_array($action, [
			Commerce_TransactionRecord::TYPE_CAPTURE,
			Commerce_TransactionRecord::TYPE_REFUND
		])
		)
		{
			throw new Exception('Wrong action: '.$action);
		}

		$order = $parent->order;
		$child = craft()->commerce_transactions->createTransaction($order);
		$child->parentId = $parent->id;
		$child->paymentMethodId = $parent->paymentMethodId;
		$child->type = $action;
		$child->amount = $parent->amount;
		$this->saveTransaction($child);

		$gateway = $parent->paymentMethod->getGateway();
		$request = $gateway->$action($this->buildPaymentRequest($child));
		$request->setTransactionReference($parent->reference);

		$order->returnUrl = $order->getCpEditUrl();
		craft()->commerce_orders->saveOrder($order);

		try
		{

			//raising event
			$event = new Event($this, [
				'type'        => $child->type,
				'request'     => $request,
				'transaction' => $child
			]);
			$this->onBeforeGatewayRequestSend($event);

			// Don't send the request
			if (!$event->performAction)
			{
				$child->status = Commerce_TransactionRecord::STATUS_FAILED;
				$this->saveTransaction($child);
			}

			// Send the request!
			if ($event->performAction)
			{

				$response = $this->_sendRequest($request, $child);

				$this->updateTransaction($child, $response);
			}
		}
		catch (\Exception $e)
		{
			$child->status = Commerce_TransactionRecord::STATUS_FAILED;
			$child->message = $e->getMessage();

			$this->saveTransaction($child);
		}

		return $child;
	}

	/**
	 * @param Commerce_TransactionModel $transaction
	 *
	 * @return Commerce_TransactionModel
	 */
	public function refundTransaction(Commerce_TransactionModel $transaction)
	{
		return $this->processCaptureOrRefund($transaction,
			Commerce_TransactionRecord::TYPE_REFUND);
	}

	/**
	 * Process return from off-site payment
	 *
	 * @param Commerce_TransactionModel $transaction
	 * @param string|null               &$customError
	 *
	 * @return bool
	 * @throws Exception
	 */
	public function completePayment(
		Commerce_TransactionModel $transaction,
		&$customError = null
	)
	{
		$order = $transaction->order;

		// ignore already processed transactions
		if ($transaction->status != Commerce_TransactionRecord::STATUS_REDIRECT)
		{
			if ($transaction->status == Commerce_TransactionRecord::STATUS_SUCCESS)
			{
				// If we already have completed this transaction, make sure the order total is correct
				craft()->commerce_orders->updateOrderPaidTotal($order);		
				return true;
			}
			else
			{
				$customError = $transaction->status;
				return false;
			}
		}

		// load payment driver
		$gateway = $transaction->paymentMethod->getGateway();

		$action = 'complete'.ucfirst($transaction->type);
		$supportsAction = 'supports'.ucfirst($action);
		if ($gateway->$supportsAction())
		{

			// Some gateways need the cart data again on the order complete
			$itemBag = $this->createItemBag($order);

			$params = $this->buildPaymentRequest($transaction,null,$itemBag);

			// If MOLLIE, the transactionReference will be theirs
			$handle = $transaction->paymentMethod->getGatewayAdapter()->handle();
			if ($handle == 'Mollie_Ideal' || $handle == 'Mollie' || $handle == 'SagePay_Server')
			{
				$params['transactionReference'] = $transaction->reference;
			}

			// don't send notifyUrl for completePurchase
			unset($params['notifyUrl']);

			$request = $gateway->$action($params);

			$success = $this->sendPaymentRequest($order, $request, $transaction, $redirect, $customError);

			if ($success)
			{
				craft()->commerce_orders->updateOrderPaidTotal($order);

				return true;
			}
			else
			{
				return false;
			}
		}
		else
		{
			throw new Exception('Payment Gateway does not support: '.$supportsAction);
		}
	}

	/**
	 *
	 * Gets the total transactions amount really paid (not authorized)
	 *
	 * @param Commerce_OrderModel $order
	 *
	 * @return static[]
	 */
	public function getTotalPaidForOrder(Commerce_OrderModel $order)
	{
		$criteria = new \CDbCriteria();
		$criteria->select = 'sum(amount) AS total, orderId';
		$criteria->addCondition(['status = :status', 'orderId = :orderId']);
		$criteria->params = [
			'orderId' => $order->id,
			'status'  => Commerce_TransactionRecord::STATUS_SUCCESS
		];
		$criteria->addInCondition('type', [Commerce_TransactionRecord::TYPE_PURCHASE, Commerce_TransactionRecord::TYPE_CAPTURE]);
		$criteria->group = 'orderId';

		$transaction = Commerce_TransactionRecord::model()->find($criteria);

		if ($transaction)
		{
			return $transaction->total;
		}

		return 0;
	}

	/**
	 * Gets the total transactions amount with authorized
	 *
	 * @param Commerce_OrderModel $order
	 *
	 * @return static[]
	 */
	public function getTotalAuthorizedForOrder(Commerce_OrderModel $order)
	{
		$criteria = new \CDbCriteria();
		$criteria->select = 'sum(amount) AS total, orderId';
		$criteria->addCondition(['status = :status', 'orderId = :orderId']);
		$criteria->params = [
			'orderId' => $order->id,
			'status'  => Commerce_TransactionRecord::STATUS_SUCCESS
		];
		$criteria->addInCondition('type', [Commerce_TransactionRecord::TYPE_AUTHORIZE, Commerce_TransactionRecord::TYPE_PURCHASE, Commerce_TransactionRecord::TYPE_CAPTURE]);
		$criteria->group = 'orderId';

		$transaction = Commerce_TransactionRecord::model()->find($criteria);

		if ($transaction)
		{
			return $transaction->total;
		}

		return 0;
	}

	/**
	 * @param $request
	 * @param $transaction
	 *
	 * @return mixed
	 */
	private function _sendRequest($request, $transaction)
	{
		$data = $request->getData();

		$modifiedData = craft()->plugins->callFirst('commerce_modifyGatewayRequestData', [$data, $transaction->type, $transaction], true);

		// We can't merge the $data with $modifiedData since the $data is not always an array.
		// For example it could be a XML object, json, or anything else really.
		if ($modifiedData !== null)
		{
			$response = $request->sendData($modifiedData);

			return $response;
		}

		$response = $request->send();

		return $response;
	}
}
