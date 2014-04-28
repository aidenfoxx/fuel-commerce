<?php

namespace Fuel\Migrations;

class Create_orders
{
	public function up()
	{
		\DBUtil::create_table('orders', array(
			'id' => array('constraint' => 11, 'type' => 'int', 'auto_increment' => true, 'unsigned' => true),
			'user_id' => array('constraint' => 11, 'type' => 'int'),
			'name' => array('constraint' => 100, 'type' => 'varchar'),
			'address_1' => array('constraint' => 100, 'type' => 'varchar'),
			'address_2' => array('constraint' => 100, 'type' => 'varchar'),
			'postcode' => array('constraint' => 9, 'type' => 'varchar'),
			'city' => array('constraint' => 100, 'type' => 'varchar'),
			'county' => array('constraint' => 100, 'type' => 'varchar'),
			'payment_method' => array('constraint' => 1, 'type' => 'tinyint', 'unsigned' => true),
			'card_number' => array('constraint' => 20, 'type' => 'varchar'),
			'created_at' => array('constraint' => 11, 'type' => 'int', 'null' => true),
			'updated_at' => array('constraint' => 11, 'type' => 'int', 'null' => true),

		), array('id'), false, 'InnoDB', 'utf8_unicode_ci',
			array(
				array(
					'constraint' => 'users',
					'key' => 'user_id',
					'reference' => array(
						'table' => 'users',
						'column' => 'id',
					),
					'on_update' => 'CASCADE',
					'on_delete' => 'CASCADE'
	        	)
	        )
		);
	}
	public function down()
	{
		\DBUtil::drop_table('orders');
	}
}