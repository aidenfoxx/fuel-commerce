<?php

namespace Fuel\Migrations;

class Create_product_variants
{
	public function up()
	{
		\DBUtil::create_table('product_variants', array(
			'id' => array('constraint' => 11, 'type' => 'int', 'auto_increment' => true, 'unsigned' => true),
			'product_id' => array('constraint' => 11, 'type' => 'int', 'unsigned' => true),
			'name' => array('constraint' => 50, 'type' => 'varchar'),
			'price_difference' => array('constraint' => '10', 'type' => 'decimal'),
			'created_at' => array('constraint' => 11, 'type' => 'int', 'null' => true),
			'updated_at' => array('constraint' => 11, 'type' => 'int', 'null' => true),

		), array('id'), false, 'InnoDB', 'utf8_unicode_ci',
			array(
				array(
					'constraint' => 'products',
					'key' => 'product_id',
					'reference' => array(
						'table' => 'products',
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
		\DBUtil::drop_table('product_variants');
	}
}