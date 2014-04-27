<?php
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
		if (\Auth::check())
		{
			\Session::set_flash('error', \Session::get_flash('error') . '<li>You are already logged in!</li>');

			\Response::redirect('/');
		}

		$this->data['title'] = "Authentication";

		if (\Input::post('submit')=='Register')
		{
			$form = $this->registration_form();
			$form->validation()->run();

			if (!$form->validation()->error())
			{
				try
				{
					// Update the user
					$created = \Auth::create_user(
						$form->validated('username'),
						$form->validated('password'),
						$form->validated('email'),
						\Config::get('application.user.default_group', 1),
						array(
							'fullname' => $form->validated('fullname'),
						)
					);

					if ($created)
					{
						\Session::set_flash('success', 'Your account has been successfully created.');

						// Account created, log the user in
						Auth::login();

						\Response::redirect_back();
					}
					else
					{
						\Session::set_flash('error', \Session::get_flash('error') . '<li>There was a problem creating your account.</li>');
					}
				}
				catch (\SimpleUserUpdateException $e)
				{
					if ($e->getCode() == 2)
					{
						\Session::set_flash('error', \Session::get_flash('error') . '<li>An account with this email address already exists.</li>');
					}
					elseif ($e->getCode() == 3)
					{
						\Session::set_flash('error', \Session::get_flash('error') . '<li>The selected username already exists.</li>');
					}
					else
					{
						\Session::set_flash('error', \Session::get_flash('error') . '<li>' . $e->getMessage() . '</li>');
					}
				}
				$form->repopulate();
			}
			else
			{
				\Session::set_flash('error', \Session::get_flash('error') . $form->show_errors(array('open_list' => '', 'close_list' => '')));
			}
		}
		else if (\Input::post('submit')=='Login')
		{
			if (Auth::login())
			{
				if (Input::post('remember'))
				{
					Auth::remember_me();
				}
				else
				{
					Auth::dont_remember_me();
				}

				\Session::set_flash('success', 'You have been successfully logged in.');

				\Response::redirect_back();
			}
			else
			{
				\Session::set_flash('error', \Session::get_flash('error') . '<li>Invalid username or password.</li>');
			}	
		}

		return View::forge('pages/authentication.tpl', $this->data);
	}

	/**
	 * Logout functionality
	 *
	 * @access  public
	 */
	public function action_logout()
	{
		if (!\Auth::logout())
		{
			\Auth::dont_remember_me();

			\Session::set_flash('success', 'You have been successfully logged out.');
		}
		\Response::redirect('/');
	}

	/**
	* Define the registration form.
	*
	* @access  public
	* @return  Fieldset
	*/
	private function registration_form()
	{
		$form = \Fieldset::forge('registerform');

		$form->add_model('Model\\Auth_User');

		$form->add('fullname', 'Full Name')->add_rule('required')->add_rule('valid_string', array('alpha', 'numeric', 'spaces'))->add_rule('max_length', 64);
		$form->add('confirm', 'Confirm Password', array('type' => 'password'));

		$form->disable('group_id');

		$form->field('password')->add_rule('required');
		$form->field('group_id')->delete_rule('required')->delete_rule('is_numeric');

		return $form;
	}
}
