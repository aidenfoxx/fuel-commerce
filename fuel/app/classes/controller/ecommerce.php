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
		$this->data['helloworld'] = 'Hello world';

		return parent::before();
	}
}
