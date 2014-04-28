{extends file="../template.tpl"}
{block name="content"}
	<h2>Manage Products</h2>
	<hr />
	<table width="100%">
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Category</th>
				<th>Price</th>
				<th>Stock</th>
				<th>Created</th>
				<th>Last Updated</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			{foreach from=$products item=product}
				<tr>
					<td>{$product['id']}</td>
					<td>{$product['name']}</td>
					<td>{$product['category']}</td>
					<td>£{$product['price']|number_format:2}</td>
					<td>{$product['stock']}</td>
					<td>{$product['created_at']|date_format:"%d/%m/%y, %H:%M"}</td>
					<td>{$product['updated_at']|date_format:"%d/%m/%y, %H:%M"}</td>
					<td>	
						{Html::anchor("products/edit/`$product['id']`", '<i class="fi-pencil small" title="Edit Product"></i>')}</i>
						{Html::anchor("products/delete/`$product['id']`", '<i class="fi-trash small" title="Delete Product">')}</i>
					</td>
				</tr>
			{foreachelse}
				<tr>
					<td colspan="8" class="text-center">
						<span>There are currently no products for sale.</span>
					</td>
				</tr>
			{/foreach}
		</tbody>
	</table>
	{Html::anchor("products/new", 'New Product', ['class' => 'button tiny'])}
{/block}