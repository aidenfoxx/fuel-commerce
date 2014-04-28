<?php

class Model_Product extends \Orm\Model
{
	protected static $_properties = array(
		'id',
		'name',
		'short_description',
		'description',
		'category',
		'price',
		'stock',
		'image',
		'created_at',
		'updated_at',
	);

	protected static $_has_many = array(
		'product_variants' => array(
			'key_from' => 'id',
			'model_to' => 'Model_Product_Variant',
			'key_to' => 'product_id',
			'cascade_save' => true,
			'cascade_delete' => true,
		)
	);

	protected static $_observers = array(
		'Orm\Observer_CreatedAt' => array(
			'events' => array('before_insert'),
			'mysql_timestamp' => false,
		),
		'Orm\Observer_UpdatedAt' => array(
			'events' => array('before_update'),
			'mysql_timestamp' => false,
		),
	);
	protected static $_table_name = 'products';

	/**
	* Not the most efficient category system, but I'm
	* running out of time.
	*
	* @return Array
	*/
	public static function getCategories()
	{
		$products = self::find('all');
		$categories = array();

		foreach ($products as $product)
		{
			if (!empty($product['category']))
			{
				$categories[$product['category']] = $product['category'];
			}
		}

		return $categories;
	}
}
