{extends file="../template.tpl"}
{block name="content"}
	<h2>Orders</h2>
	<hr />
	{foreach from=$orders item=order}
		<fieldset>
			<legend>Order: {$order['id']}</legend>
			<table width="100%;" id="cart">
				<thead>
					<tr>
						<th>ID</th>
						<th>Product Name</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Line Price</th>
					</tr>
				</thead>
				<tbody>
				{$totalPrice=0}
				{$orderLines=Model_Order_Line::find('all', ['where' => ['order_id' => $order['id']]])}
				{foreach from=$orderLines item=line}
					{$product=Model_Product::find($line['product_id'])}
					<tr>
						<td>{$product['id']}</td>
						<td><a href="{URI::create("products/view/`$product['id']`")}">{$product['name']}</a></td>
						<td>£{$line['price']|number_format:2}</td>
						<td><input type="text" name="quantity" value="{$line['quantity']}" class="quantity" disabled /></td>
						<td>£{($line['quantity'] * $line['price'])|number_format:2}</td>
					</tr>
					{$totalPrice=($totalPrice + ($line['quantity'] * $line['price']))}
				{/foreach}
				</tbody>
				<tfoot>
					<tr>
						<td colspan="4">Total VAT (20%):</td>
						<td>£{($totalPrice * .2)|number_format:2}</td>
					</tr>
					<tr>
						<td colspan="4">Total Price:</td>
						<td>£{$totalPrice|number_format:2}</td>
					</tr>
				</tfoot>
			</table>
			<p>
				<strong>Order time: </strong> {$order['created_at']|date_format:"%d/%m/%y, %H:%M"}<br />
				<strong>Full Name: </strong> {$order['name']}<br />
				<strong>Address 1: </strong> {$order['address_1']}<br />
				<strong>Address 2: </strong> {$order['address_2']}<br />
				<strong>Postcode: </strong> {$order['postcode']}<br />
				<strong>Town/City: </strong> {$order['city']}<br />
				<strong>County: </strong> {$order['county']}<br />
				<strong>Payment Method: </strong> {if $order['payment_method']==1}Visa{elseif $order['payment_method']==2}Maestro{elseif $order['payment_method']==3}Delta{elseif $order['payment_method']==4}MasterCard{elseif $order['payment_method']==5}Electron{elseif $order['payment_method']==6}Solo{/if}<br />
				<strong>Card Number (Last 4 Digits): </strong> {substr($order['card_number'], -4)}<br />
			</p>
		</fieldset>
	{foreachelse}
		<p>No orders to display.</p>
	{/foreach}
{/block}