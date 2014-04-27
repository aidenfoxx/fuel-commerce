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
 * The Index Controller.
 *
 * A basic controller which defines the homepage.
 *
 * @package  app
 * @extends  Controller_Ecommerce
 */
class Controller_Index extends Controller_Ecommerce
{

	/**
	 * Homepage
	 *
	 * @access  public
	 * @return  View
	 */
	public function action_index()
	{
		$this->data['title'] = "Home";

		return View::forge('pages/index.tpl', $this->data);
	}

	/**
	 * The 404 action for the application.
	 *
	 * @access  public
	 * @return  Response
	 */
	public function action_404()
	{
		$this->data['title'] = "Page Not Found";

		return Response::forge(View::forge('pages/404.tpl', $this->data), 404);
	}
}
