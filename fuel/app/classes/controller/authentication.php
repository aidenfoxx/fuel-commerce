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
 * The Authentication Controller
 *
 * A controller which handles the login and registration of users.
 *
 * @package  app
 * @extends  Controller_Ecommerce
 */
class Controller_Authentication extends Controller_Ecommerce
{

	/**
	 * Default Authentication page
	 *
	 * @access  public
	 * @return  View
	 */
	public function action_index()
	{
		$this->data['title'] = "Authentication";

		return View::forge('pages/authentication.tpl', $this->data);
	}
}
