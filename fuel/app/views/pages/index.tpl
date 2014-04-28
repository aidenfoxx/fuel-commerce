{extends file="../template.tpl"}
{block name="content"}
	<h2>Welcome to Isherwood Athletics</h2>
	<hr />
	<div class="row">
		<div class="large-8 columns">
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In id euismod diam. Ut non sapien vitae urna ultricies dignissim. Praesent nec tincidunt sapien. Sed vel nibh mauris. Vestibulum quis metus ornare, laoreet erat sed, tempus quam. Integer sed porttitor erat. Curabitur risus arcu, rutrum in dictum eu, sollicitudin vel lectus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce sed odio eu elit ornare placerat porta vitae nulla.</p>
			<p>Nam congue ullamcorper massa, id congue elit suscipit vitae. Pellentesque sem erat, tempus dignissim erat a, vestibulum mollis est. Integer auctor interdum justo, at elementum sem vulputate vel. Proin consectetur a ligula nec tempus. Cras mattis, erat vitae luctus lobortis, lectus velit pharetra mi, at consectetur est orci non quam. Fusce ut sagittis augue. Phasellus pharetra placerat sollicitudin. Pellentesque placerat a eros et tincidunt. Phasellus elit ante, venenatis nec massa in, ultrices convallis arcu. Donec condimentum dui mi, vitae porta neque pretium eu.</p>
			<p>Fusce lacus magna, aliquam quis eros a, adipiscing pellentesque lectus.</p>
		</div>
		<div class="large-4 columns">
			<fieldset>
				<legend>Recent Products</legend>
				<ul>
					{foreach from=$recent_products item=product}
						<li>{Html::anchor("products/view/`$product['id']`", $product['name'])}<span class="right">£{$product['price']|number_format:2}</span></li>
					{/foreach}
				</ul>
			</fieldset>
			<fieldset>
				<legend>Product Categories</legend>
				<ul>
					<li>{Html::anchor('products', 'All Products')}</li>
					{foreach from=$product_categories item=category}
						<li>{Html::anchor("products/category/`$category`", $category)}</li>
					{/foreach}
				</ul>
			</fieldset>
		</div>
	</div>
{/block}