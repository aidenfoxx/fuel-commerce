{extends file="../template.tpl"}
{block name="content"}
	<h2>{if isset($product)}Edit{else}Add{/if} Product</h2>
	<hr />
	<div class="row">
		<div class="large-8 columns">
			<fieldset>
				<legend>Product Information</legend>
				<form method="POST" enctype="multipart/form-data">
					<label for="product_name">Product Name</label>
					<input type="text" id="product_name" name="product_name" value="{if Input::post('product_name')}{Input::post('product_name')}{elseif isset($product) && $product['name']}{$product['name']}{/if}">
					<label for="product_image">Product Image</label>
					<input type="file" name="product_image" id="product_image"><br>
					<label for="product_category">Category</label>
					<input type="text" id="product_category" name="product_category" value="{if Input::post('product_category')}{Input::post('product_pcategory')}{elseif isset($product) && $product['category']}{$product['category']}{/if}">
					<label for="product_price">Price (£)</label>
					<input type="text" id="product_price" name="product_price" value="{if Input::post('product_price')}{Input::post('product_price')}{elseif isset($product) && $product['price']}{$product['price']}{/if}">
					<label for="product_stock">Stock</label>
					<input type="text" id="product_stock" name="product_stock" value="{if Input::post('product_stock')}{Input::post('product_stock')}{elseif isset($product) && $product['stock']}{$product['stock']}{/if}">
					<label for="product_short_description">Short Description</label>
					<textarea id="product_short_description" name="product_short_description" style="height: 200px;">{if Input::post('product_short_description')}{Input::post('product_short_description')}{elseif isset($product) && $product['short_description']}{$product['short_description']}{/if}</textarea>
					<label for="product_description">Description (Supports HTML)</label>
					<textarea id="product_description" name="product_description" style="height: 200px;">{if Input::post('product_description')}{Input::post('product_description')}{elseif isset($product) && $product['description']}{$product['description']}{/if}</textarea>
					<input type="submit" name="submit" value="{if isset($product)}Update{else}Add{/if}" class="tiny button">
				</form>
			</fieldset>
		</div>
		<div class="large-4 columns">
			<fieldset>
				<legend>User Help</legend>
			</fieldset>
		</div>
	</div>
{/block}