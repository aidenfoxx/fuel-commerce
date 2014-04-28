<!doctype html>
<html class="no-js" lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="{if isset($description)}{$description}{/if}">
	<meta name="keywords" content="{if isset($keywords)}{$keywords}{/if}" >
	<title>Isherwood Athletics - {$title}</title>
	{Asset::css(array(
		'foundation.css',
		'responsive-tables.css',
		'fonts/foundation-icons.css',
		'presentation.css'
	))}
	{Asset::js(array(
		'vendor/custom.modernizr.js',
		'jquery.js'
	))}
</head>
<body>
	<header>
    	<div id="navigation">
	    	<div class="row">
				<nav class="top-bar" data-topbar>
					<ul class="title-area">
						<li class="name">
							<h1 class="hide-for-small">{Html::anchor('/', 'Isherwood Athletics')}</h1>
						</li>
						<li class="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a></li>
					</ul>
					<section class="top-bar-section">
						<ul class="right">
							<li class="divider"></li>
							<li>{Html::anchor('/', 'Home')}</li>
							<li class="divider"></li>
							<li class="has-dropdown">
								<a>Products</a>
								<ul class="dropdown">
									<li>{Html::anchor('products', 'All Products')}</li>
									{foreach from=$product_categories item=category}
										<li>{Html::anchor("products/category/`$category`", $category)}</li>
									{/foreach}
								</ul>
							</li>
							<li class="divider"></li>
							{if Auth::check()}
								<li class="has-dropdown">
									<a>My Account</a>
									<ul class="dropdown">
										<li>{Html::anchor('account/orders', 'Orders')}</li>
										{if Auth::member(2)}<li>{Html::anchor('account/users', 'Manage Users')}</li>{/if}
										{if Auth::member(2)}<li>{Html::anchor('products/edit', 'Manage Products')}</li>{/if}
										<li>{Html::anchor('account/details', 'Personal Information')}</li>
										<li>{Html::anchor('authentication/logout', 'Logout')}</li>
									</ul>
								</li>
							{else}
								<li>{Html::anchor('authentication', 'Login/Register')}</li>
							{/if}
							<li class="divider"></li>
							{if isset($smarty.session.cart)}
								{$cartNo=count($smarty.session.cart)}
							{else}
								{$cartNo=0}
							{/if}
							<li>{Html::anchor('checkout/cart', "Shopping Cart (`$cartNo` Items)")}</li>
							<li class="divider hide-for-medium-down"></li>
						</ul>
					</section>
				</nav>
			</div>
		</div>
	</header>
	<div id="content">
		<div id="errors" class="row">
			<div class="large-12 columns">
				{* Display defined messages *}
				{if Session::get_flash('error')}
					<div data-alert class="alert-box warning">
						<p>The following error(s) occured:</p>
						<ul>
							{Session::get_flash('error')}
						</ul>
						<a href="#" class="close">&times;</a>
					</div>
				{/if}
				{if Session::get_flash('success')}
					<div data-alert class="alert-box success">
						<span>{Session::get_flash('success')}</span>
						<a href="#" class="close">&times;</a>
					</div>
				{/if}
				{block name="content"}

				{/block}
			</div>
		</div>
		<div class="row">
			<div class="large-12 columns">
				<hr />
				<p class="right">Copyright Isherwood Athletics &copy; 2013-2014</p>
				<p>Fuel Version: {Fuel::VERSION}</p>
			</div>
		</div>
	</div>
	{Asset::js(array(
		'foundation.min.js',
		'foundation/foundation.js',
		'foundation/foundation.abide.js',
		'foundation/foundation.accordion.js',
		'foundation/foundation.alert.js',
		'foundation/foundation.clearing.js',
		'foundation/foundation.dropdown.js',
		'foundation/foundation.interchange.js',
		'foundation/foundation.joyride.js',
		'foundation/foundation.magellan.js',
		'foundation/foundation.offcanvas.js',
		'foundation/foundation.orbit.js',
		'foundation/foundation.reveal.js',
		'foundation/foundation.tab.js',
		'foundation/foundation.tooltip.js',
		'foundation/foundation.topbar.js',
		'responsive-tables.js'
	))}
	<script>
		$(document).foundation();
	</script>
</body>
</html>
