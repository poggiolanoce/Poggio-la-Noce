<?php
namespace Craft;

/**
 * Variable class.
 *
 * @author    Pixel & Tonic, Inc. <support@pixelandtonic.com>
 * @copyright Copyright (c) 2015, Pixel & Tonic, Inc.
 * @license   https://craftcommerce.com/license Craft Commerce License Agreement
 * @see       https://craftcommerce.com
 * @package   craft.plugins.commerce.variables
 * @since     1.0
 */
class CommerceVariable
{
	/**
	 * Get Commerce settings
	 *
	 * @return mixed
	 */
	public function settings()
	{
		return craft()->commerce_settings->getSettings();
	}

	/**
	 * @param array|null $criteria
	 *
	 * @return ElementCriteriaModel|null
	 */
	public function products($criteria = null)
	{
		return craft()->elements->getCriteria('Commerce_Product', $criteria);
	}

	/**
	 * @param array|null $criteria
	 *
	 * @return ElementCriteriaModel|null
	 */
	public function variants($criteria = null)
	{
		return craft()->elements->getCriteria('Commerce_Variant', $criteria);
	}

	/**
	 * @param array|null $criteria
	 *
	 * @return ElementCriteriaModel|null
	 */
	public function orders($criteria = null)
	{

		if (!isset($criteria['isCompleted']))
		{
			$criteria['isCompleted'] = true;
		}

		return craft()->elements->getCriteria('Commerce_Order', $criteria);
	}

	/**
	 * @return Commerce_OrderModel
	 */
	public function getCart()
	{
		return craft()->commerce_cart->getCart();
	}

	/**
	 * @return Commerce_CustomerModel
	 */
	public function getCustomer()
	{
		return craft()->commerce_customers->getCustomer();
	}

	/**
	 * @return array
	 */
	public function getCountries()
	{
		return craft()->commerce_countries->getAllCountries();
	}

	/**
	 * @return array
	 */
	public function getStates()
	{
		return craft()->commerce_states->getAllStates();
	}

	/**
	 * @return array [id => name]
	 */
	public function getCountriesList()
	{
		return craft()->commerce_countries->getAllCountriesListData();
	}

	/**
	 * @return array
	 */
	public function getStatesArray()
	{
		return craft()->commerce_states->getStatesGroupedByCountries();
	}

	/**
	 * @return array
	 */
	public function getAvailableShippingMethods()
	{
		$cart = craft()->commerce_cart->getCart();

		return craft()->commerce_shippingMethods->getOrderedAvailableShippingMethods($cart);
	}

	/**
	 * @return array
	 */
	public function getPaymentMethods()
	{
		$methods = craft()->commerce_paymentMethods->getAllFrontEndPaymentMethods();

		// Need to put the methods into an array keyed by method ID for backwards compatibility.
		$available = [];
		foreach ($methods as $method)
		{
			$available[$method->id] = $method;
		}

		return $available;
	}

	/**
	 * @return array
	 */
	public function getProductTypes()
	{
		return craft()->commerce_productTypes->getAllProductTypes();
	}

	/**
	 * @return array
	 */
	public function getOrderStatuses()
	{
		return array_map(function ($status)
		{
			return $status->attributes;
		}, craft()->commerce_orderStatuses->getAllOrderStatuses());
	}

	/**
	 * @return array
	 */
	public function getTaxCategories()
	{
		$taxCategories = craft()->commerce_taxCategories->getAllTaxCategories();

		return \CHtml::listData($taxCategories, 'id', 'name');
	}

	/**
	 * @return Commerce_DiscountModel[]
	 */
	public function getDiscounts()
	{
		$discounts = craft()->commerce_discounts->getAllDiscounts();

		return $discounts;
	}

	/**
	 * @param string $code
	 *
	 * @return Commerce_DiscountModel|null
	 */
	public function getDiscountByCode($code)
	{
		$discount = craft()->commerce_discounts->getDiscountByCode($code);

		return $discount;
	}

	/**
	 * @return Commerce_SaleModel[]
	 */
	public function getSales()
	{
		$sales = craft()->commerce_sales->getAllSales();

		return $sales;
	}
}
