{extends file="../template.tpl"}
{block name="content"}
	<h2>{$product['name']}</h2>
	<hr />
	<div class="row" id="product_description">
		<div class="large-5 columns">
			<img src="{URI::create("uploads/`$product['image']`")}" />
		</div>
		<div class="large-7 columns">
			<h3>{$product['name']}</h3>
			<p>{$product['short_description']}</p>
			<p><strong>£{$product['price']|number_format:2}</strong></p>
			
			<form method="post" action="{URI::create("checkout/cart")}">
				<input type="hidden" name="product_id" value="{$product['id']}">
				<p>
					<label>Stock: {$product['stock']}</label>
					<label for="quantity">Quantity:</label>
					<input type="text" id="quantity" name="quantity" value="1">
				</p>
				<p><input type="submit" value="Add to Cart" class="button tiny" /></p>
			</form>
			<hr />
			<div class="row">
				<div class="large-12 columns">
					{$product['description']|html_entity_decode}
				</div>
			</div>
		</div>
	</div>
{/block}