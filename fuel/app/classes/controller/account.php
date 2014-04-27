<?php
/**
 * The Account Controller
 *
 * A controller which user account related tasks.
 *
 * @package  app
 * @extends  Controller_Ecommerce
 */
class Controller_Account extends Controller_Ecommerce
{
	/**
	 * Edit user personal information
	 *
	 * @access  public
	 * @return  Mixed
	 */
	public function action_details()
	{
		if (\Auth::check())
		{
			if (Input::post())
			{
				$form = $this->registration_form();
				$form->validation()->run();

				if (!$form->validation()->error())
				{
					try
					{
						// If no new password defined, use the old one
						if (Input::post('new_password')) 
						{
							$new_password = $form->validated('new_password');
						}
						else
						{
							$new_password = $form->validated('confirm');
						}

						$update = Auth::update_user(
							array(
								'email'           => $form->validated('email'),
						 		'password'        => $new_password,
								'old_password'    => $form->validated('confirm'),
								'fullname'        => $form->validated('fullname'),
							)
						);

						if ($update)
						{
							\Session::set_flash('success', 'Your account details have been successfully updated.');
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
						else
						{
							\Session::set_flash('error', \Session::get_flash('error') . '<li>' . $e->getMessage() . '</li>');
						}
					}
					catch(SimpleUserWrongPassword $e)
					{
						\Session::set_flash('error', \Session::get_flash('error') . '<li>You must confirm your current password before your details can be updated.</li>');
					}

					$form->repopulate();
				}
				else
				{
					\Session::set_flash('error', \Session::get_flash('error') . $form->show_errors(array('open_list' => '', 'close_list' => '')));
				}
			}

			$this->data['title'] = "Personal Information";

			return View::forge('pages/details.tpl', $this->data);
		}

		// If user is not logged in redirect to auth
		\Response::redirect('authentication');
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
		$form->add('new_password', 'New Password', array('type' => 'password'))->add_rule('min_length', 8);
		$form->add('confirm', 'Current Password', array('type' => 'password'));

		$form->disable('group_id');
		$form->disable('username');
		$form->disable('password');

		$form->field('username')->delete_rule('required');
		$form->field('password')->delete_rule('required')->delete_rule('match_field');
		$form->field('group_id')->delete_rule('required')->delete_rule('is_numeric');

		return $form;
	}
}
