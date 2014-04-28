<?php
/**
 * The Checkout Controller
 *
 * A controller handles the users checkout process.
 *
 * @package  app
 * @extends  Controller_Ecommerce
 */
class Controller_Checkout extends Controller_Ecommerce
{
	/**
	 * Load the shopping cart.
	 *
	 * @access  public
	 * @return  Mixed
	 */
	public function action_cart()
	{
		if (Input::post())
		{
			$product = Model_Product::find(Input::post('product_id'));

			if (isset($product) && $product->stock >= Input::post('quantity') && Input::post('quantity') > 0)
			{
				$_SESSION['cart'][$product['id']]['qty'] = Input::post('quantity');
			}
			else if (Input::post('quantity') <= 0)
			{
				unset($_SESSION['cart'][$product['id']]);
			}
			else
			{
				// If not enough stock, just use what stock we have
				if ($product->stock < Input::post('quantity'))
				{
					$_SESSION['cart'][$product['id']]['qty'] = $product->stock;
				}

				Session::set_flash('error', Session::get_flash('error') . '<li>The product quantity you have requested is not avalible.</li>');
			}
		}

		$this->data['title'] = "Shopping Cart";

		return View::forge('pages/cart.tpl', $this->data);
	}

	public function action_payment()
	{
		if (Auth::check() && isset($_SESSION['cart']) && count($_SESSION['cart']) > 0)
		{
			if (Input::post())
			{
				$address_form = Fieldset::forge('address');
				$payment_form = Fieldset::forge('payment');

				$address_form->add('name', 'Fullname')->add_rule('required');
				$address_form->add('address_1', 'Address Line 1')->add_rule('required');
				$address_form->add('postcode', 'Postcode')->add_rule('required');
				$address_form->add('city', 'Town/City')->add_rule('required');

				$payment_form->add('card_number', 'Card Number')->add_rule('required')->add_rule('valid_string', array('numeric'));;
				$payment_form->add('card_type', 'Card Type')->add_rule('required')->add_rule('numeric_between', 1, 6);
				$payment_form->add('card_expiry_1', 'Expiry Month')->add_rule('required')->add_rule('numeric_between', 1, 12);
				$payment_form->add('card_expiry_2', 'Expiry Year')->add_rule('required')->add_rule('numeric_between', 14, 25);
				$payment_form->add('card_csv', 'Card CSV Number')->add_rule('required')->add_rule('valid_string', array('numeric'))->add_rule('exact_length', 3);

				$address_form->validation()->run();
				$payment_form->validation()->run();

				if (!$address_form->validation()->error() && !$payment_form->validation()->error() && $this->luhn_check(Input::post('card_number')))
				{
					// Create the order
					$order = new Model_Order();
					$order->user_id = (int) Auth::get_user_id();
					$order->name = Input::post('name');
					$order->address_1 = Input::post('address_1');
					$order->address_2 = Input::post('address_2');
					$order->postcode = Input::post('postcode');
					$order->city = Input::post('city');
					$order->county = Input::post('county');
					$order->payment_method = Input::post('card_type');
					$order->card_number = Input::post('card_number');

					if ($order->save())
					{
						$error = false;

						foreach ($_SESSION['cart'] as $id => $line) {
							// Load the product and ipdate it's stock
							$product = Model_Product::find($id);
							$product->stock = $product->stock - $line['qty'];

							// Create the new order line
							$new_line = new Model_Order_Line();
							$new_line->order_id = $order->id;
							$new_line->product_id = $product->id;
							$new_line->quantity = $line['qty'];
							$new_line->price = $product->price;

							// Save the line and the product
							if (!$new_line->save() || !$product->save())
							{
								$error = true;
							}
						}

						if ($error)
						{
							Session::set_flash('error', Session::get_flash('error') . '<li>There was a problem saving the order.</li>');
						}
						else
						{
							// Unset the cart and redirect to orders page
							unset($_SESSION['cart']);
							Session::set_flash('success', 'Your order has been successfully created.');
							Response::redirect('account/orders');
						}

					}
					else
					{
						Session::set_flash('error', Session::get_flash('error') . '<li>There was a problem saving the order.</li>');
					}

				}
				else
				{
					Session::set_flash('error', Session::get_flash('error') . $address_form->show_errors(array('open_list' => '', 'close_list' => '')));
					Session::set_flash('error', Session::get_flash('error') . $payment_form->show_errors(array('open_list' => '', 'close_list' => '')));

					if (!$this->luhn_check(Input::post('card_number')))
					{
						Session::set_flash('error', Session::get_flash('error') . '<li>The Card Number you have entered is invalid.</li>');
					}
				}
			}

			$this->data['title'] = "Payment";

			return View::forge('pages/payment.tpl', $this->data);
		}
		else if (!isset($_SESSION['cart']) || count($_SESSION['cart']) <= 0)
		{
			// Cart is empty. Redirect back
			Response::redirect('checkout/cart');
		}
		else
		{
			Session::set_flash('error', Session::get_flash('error') . '<li>You must be logged in to proceed with checkout.</li>');

			Response::redirect('authentication');
		}
	}

	/* Luhn algorithm number checker - (c) 2005-2008 shaman - www.planzero.org *
	* This code has been released into the public domain, however please      *
	* give credit to the original author where possible.                      */
	private function luhn_check($number) {
		$number=preg_replace('/\D/', '', $number);
		$number_length=strlen($number);
		$parity=$number_length % 2;
		$total=0;
		for ($i=0; $i<$number_length; $i++)
		{
			$digit=$number[$i];
			if ($i % 2 == $parity)
			{
				$digit*=2;
				if ($digit > 9)
				{
					$digit-=9;
				}
			}
			$total+=$digit;
		}
		return ($total % 10 == 0) ? TRUE : FALSE;
	}
}
