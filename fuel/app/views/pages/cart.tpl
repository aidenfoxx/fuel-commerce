{extends file="../template.tpl"}
{block name="content"}
	<h2>Shopping Cart</h2>
	<hr />
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
		{if isset($smarty.session.cart) && count($smarty.session.cart) > 0}
			{foreach from=$smarty.session.cart key=id item=line}
				{$product=Model_Product::find($id)}
				<tr>
					<td>{$product['id']}</td>
					<td><a href="{URI::create("products/view/`$product['id']`")}">{$product['name']}</a></td>
					<td>£{$product['price']|number_format:2}</td>
					<td>
						<form method="POST">
							<input type="hidden" name="product_id" value="{$product['id']}">
							<input type="text" name="quantity" value="{$line['qty']}" class="quantity" />
						</form>
					</td>
					<td>£{($line['qty'] * $product['price'])|number_format:2}</td>
				</tr>
				{$totalPrice=($totalPrice + ($line['qty'] * $product['price']))}
			{/foreach}
		{else}
			<tr>
				<td colspan="5" class="text-center">
					<span>You have no items in your shopping cart.</span>
				</td>
			</tr>
		{/if}
		</tbody>
		{if isset($smarty.session.cart) && count($smarty.session.cart) > 0}
			<tfoot>
				<tr>
					<td colspan="4">Total Price:</td>
					<td>£{$totalPrice|number_format:2}</td>
				</tr>
			</tfoot>
		{/if}
	</table>
	{if isset($smarty.session.cart) && count($smarty.session.cart) > 0}
		{Html::anchor("checkout/payment", 'Continue Checkout', ['class' => 'button tiny'])}
	{/if}
	<script type="text/javascript">
		{literal}
		$('#cart .quantity').change(function() {
			$(this).parents('form').submit();
		});
		{/literal}
	</script>
{/block}