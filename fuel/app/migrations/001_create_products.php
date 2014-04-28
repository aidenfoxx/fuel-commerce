<?php

namespace Fuel\Migrations;

class Create_products
{
	public function up()
	{
		\DBUtil::create_table('products', array(
			'id' => array('constraint' => 11, 'type' => 'int', 'auto_increment' => true, 'unsigned' => true),
			'name' => array('constraint' => 50, 'type' => 'varchar'),
			'short_description' => array('type' => 'text'),
			'description' => array('type' => 'text'),
			'category' => array('constraint' => 50, 'type' => 'varchar'),
			'price' => array('constraint' => array(5,2), 'type' => 'decimal', 'unsigned' => true),
			'stock' => array('constraint' => 3, 'type' => 'int', 'unsigned' => true),
			'image' => array('constraint' => 100, 'type' => 'varchar'),
			'created_at' => array('constraint' => 11, 'type' => 'int', 'null' => true),
			'updated_at' => array('constraint' => 11, 'type' => 'int', 'null' => true),

		), array('id'));
	}

	public function down()
	{
		\DBUtil::drop_table('products');
	}
}