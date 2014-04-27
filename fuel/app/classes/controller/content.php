<?php
/**
 * The Content Controller
 *
 * A simple controller to handle plaing content pages.
 *
 * @package  app
 * @extends  Controller_Ecommerce
 */
class Controller_Content extends Controller_Ecommerce
{

	/**
	 * Contact Page
	 *
	 * @access  public
	 * @return  View
	 */
	public function action_contact()
	{
		$this->data['title'] = "Contact Us";

		return View::forge('pages/contact.tpl', $this->data);
	}

	public function action_about()
	{
		$this->data['title'] = "About Us";

		return View::forge('pages/about.tpl', $this->data);
	}
}
