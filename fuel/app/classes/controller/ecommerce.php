<?php
/**
 * The E-Commerce Controller.
 *
 * A basic controller which defines some global site attributes.
 *
 * @package  app
 * @extends  Controller
 */
class Controller_Ecommerce extends Controller
{

	public $data = array();

	public function before()
	{
		// FuelPHP sessions class is super rigid, so I'll just used PHPs for the cart
		session_start();

		$this->data['helloworld'] = 'Hello world';
		$this->data['product_categories'] = Model_Product::getCategories();
		$this->data['recent_products'] = Model_Product::find('all', array('order_by' => 'updated_at', 'limit' => 5));

		return parent::before();
	}
}
