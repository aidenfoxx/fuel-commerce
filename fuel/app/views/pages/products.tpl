{extends file="../template.tpl"}
{block name="content"}
	<h2>Products</h2>
	<hr />
	<div class="row" id="products">
		{foreach from=$products item=product name=products}

				<div class="large-3 columns text-center">
					<a href="{URI::create("products/view/`$product['id']`")}">
						<img src="{URI::create("uploads/`$product['image']`")}" />
						<h4>{$product['name']}</h4>
						<p>
							<strong>£{$product['price']|number_format:2}</strong>
						</p>
					</a>
				</div>

			{if $smarty.foreach.products.index % 3 == 0 && $smarty.foreach.products.index != 0}
				</div>
				<div class="row">
			{/if}

			{if $product@last}</div>{/if}
		{foreachelse}
			<div class="large-12 columns">
				<p>There are currently no products for sale in this category.</p>
			</div>
		{/foreach}
	</div>
{/block}