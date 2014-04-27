<?php
/**
 * Fuel is a fast, lightweight, community driven PHP5 framework.
 *
 * @package    Fuel
 * @version    1.7
 * @author     Fuel Development Team
 * @license    MIT License
 * @copyright  2010 - 2013 Fuel Development Team
 * @link       http://fuelphp.com
 */

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
		$this->data['helloworld'] = 'Hello world';

		return parent::before();
	}
}
