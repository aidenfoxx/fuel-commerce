<?php

namespace Fuel\Migrations;

class Create_order_lines
{
	public function up()
	{
		\DBUtil::create_table('order_lines', array(
			'id' => array('constraint' => 11, 'type' => 'int', 'auto_increment' => true, 'unsigned' => true),
			'order_id' => array('constraint' => 11, 'type' => 'int', 'unsigned' => true),
			'product_id' => array('constraint' => 11, 'type' => 'int', 'unsigned' => true),
			'quantity' => array('constraint' => 3, 'type' => 'int'),
			'price' => array('constraint' => array(5,2), 'type' => 'decimal', 'unsigned' => true),
			'created_at' => array('constraint' => 11, 'type' => 'int', 'null' => true),
			'updated_at' => array('constraint' => 11, 'type' => 'int', 'null' => true),

		), array('id'), false, 'InnoDB', 'utf8_unicode_ci',
			array(
				array(
					'constraint' => 'product',
					'key' => 'product_id',
					'reference' => array(
						'table' => 'products',
						'column' => 'id',
					),
					'on_update' => 'CASCADE',
					'on_delete' => 'CASCADE'
	        	),
				array(
					'constraint' => 'order',
					'key' => 'order_id',
					'reference' => array(
						'table' => 'orders',
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
		\DBUtil::drop_table('order_lines');
	}
}