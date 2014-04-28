<?php
/**
 * The Products Controller
 *
 * A controller for managing products.
 *
 * @package  app
 * @extends  Controller_Ecommerce
 */
class Controller_Products extends Controller_Ecommerce
{
	/**
	 * List all products.
	 *
	 * @access  public
	 * @return  Mixed
	 */
	public function action_index()
	{
		$this->data['title'] = 'Products';
		$this->data['products'] = Model_Product::find('all');

		return View::forge('pages/products.tpl', $this->data);	
	}

	/**
	 * List all products in a category.
	 *
	 * @access  public
	 * @return  Mixed
	 */
	public function action_category($category)
	{
		$this->data['title'] = 'Products';
		$this->data['products'] = Model_Product::find('all', array('where' => array('category' => $category)));

		return View::forge('pages/products.tpl', $this->data);	
	}

	public function action_view($productID)
	{
		$this->data['title'] = 'View Product';
		$this->data['product'] = Model_Product::find($productID);

		return View::forge('pages/product.tpl', $this->data);
	}

	/**
	 * Admin functionality for managing products.
	 *
	 * @access  public
	 * @return  Mixed
	 */
	public function action_edit($productID = null)
	{
		if (Auth::check())
		{
			// Check if they have admin permissions
			if (Auth::member(2))
			{
				if (!$productID)
				{
					$this->data['title'] = 'Manage Products';
					$this->data['products'] = Model_Product::find('all');

					return View::forge('pages/manage_products.tpl', $this->data);
				}
				else
				{
					$product = Model_Product::find($productID);

					if (Input::post())
					{
						// Upload config
						$config = array(
							'path' => DOCROOT.'uploads',
							'randomize' => true,
							'ext_whitelist' => array('img', 'jpg', 'jpeg', 'gif', 'png'),
						);

						Upload::process($config);

						if (Upload::is_valid())
						{
							Upload::save();
							$file = Upload::get_files('product_image');
							$product->image = $file['saved_as'];
						}

						// Save the updated product
						$product->name = Input::post('product_name');
						$product->price = Input::post('product_price');
						$product->stock = Input::post('product_stock');
						$product->category = Input::post('product_category');
						$product->short_description = Input::post('product_short_description');
						$product->description = Input::post('product_description');

						if ($product->save())
						{
							Session::set_flash('success', 'Product successfully updated.');
							Response::redirect('products/edit');
						}
						else
						{
							Session::set_flash('error', Session::get_flash('error') . '<li>There was a problem updating the product.</li>');
						}
					}

					$this->data['title'] = 'Edit Product';
					$this->data['product'] = $product;
					
					return View::forge('pages/add_products.tpl', $this->data);
				}

			}
			else
			{
				Session::set_flash('error', Session::get_flash('error') . '<li>You do not have permission to access this area.</li>');
				Response::redirect('/');
			}
		}
		
		// If user is not logged in redirect to auth
		Response::redirect('authentication');
	}

	public function action_new()
	{
		if (Input::post())
		{
			// Upload config
			$config = array(
				'path' => DOCROOT.'uploads',
				'randomize' => true,
				'ext_whitelist' => array('img', 'jpg', 'jpeg', 'gif', 'png'),
			);

			Upload::process($config);

			if (Upload::is_valid())
			{
				Upload::save();
				$file = Upload::get_files('product_image');
				$image = $file['saved_as'];
			}
			else
			{
				$image = 'default.JPG';
			}

			// Save the new product
			$new = new Model_Product();
			$new->name = Input::post('product_name');
			$new->image = $image;
			$new->price = Input::post('product_price');
			$new->stock = Input::post('product_stock');
			$new->category = Input::post('product_category');
			$new->short_description = Input::post('product_short_description');
			$new->description = Input::post('product_description');

			if ($new->save())
			{
				Session::set_flash('success', 'Product successfully created.');
				Response::redirect('products/edit');
			}
			else
			{
				Session::set_flash('error', Session::get_flash('error') . '<li>There was a problem adding the product.</li>');
			}
		}

		$this->data['title'] = 'Add Product';

		return View::forge('pages/add_products.tpl', $this->data);
	}

	public function action_delete($productID = null)
	{
		if ($productID)
		{
			$product = Model_Product::find($productID);
			if($product->delete())
			{
				Session::set_flash('success', 'Product successfully deleted.');
			}
		}
		Response::redirect('products/edit');
	}
}
