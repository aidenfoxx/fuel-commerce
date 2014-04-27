<?php /* Smarty version Smarty-3.1-DEV, created on 2014-04-27 12:08:41
         compiled from "C:\WAMP\www\fuel-commerce\fuel\app\views\pages\index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:28405535ced95c37a23-17562960%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '9b4ded13e86719f3a11b7b84db88c1cb8b0cce46' => 
    array (
      0 => 'C:\\WAMP\\www\\fuel-commerce\\fuel\\app\\views\\pages\\index.tpl',
      1 => 1398599816,
      2 => 'file',
    ),
    'c5ae2f899df7a319a72eb1ef03e9539c7bfdd580' => 
    array (
      0 => 'C:\\WAMP\\www\\fuel-commerce\\fuel\\app\\views\\template.tpl',
      1 => 1398600520,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '28405535ced95c37a23-17562960',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1-DEV',
  'unifunc' => 'content_535ced95c54cf9_71843276',
  'variables' => 
  array (
    'description' => 0,
    'keywords' => 0,
    'title' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_535ced95c54cf9_71843276')) {function content_535ced95c54cf9_71843276($_smarty_tpl) {?><!doctype html>
<html class="no-js" lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="<?php if (isset($_smarty_tpl->tpl_vars['description']->value)) {?><?php echo $_smarty_tpl->tpl_vars['description']->value;?>
<?php }?>">
	<meta name="keywords" content="<?php if (isset($_smarty_tpl->tpl_vars['keywords']->value)) {?><?php echo $_smarty_tpl->tpl_vars['keywords']->value;?>
<?php }?>" >
	<title>Isherwood Athletics - <?php echo $_smarty_tpl->tpl_vars['title']->value;?>
</title>
	<?php echo Asset::css(array('foundation.css','responsive-tables.css','fonts/foundation-icons.css','presentation.css'));?>

	<?php echo Asset::js(array('vendor/custom.modernizr.js'));?>

</head>
<body>
	<header>
    	<div id="navigation">
	    	<div class="row">
				<nav class="top-bar" data-topbar>
					<ul class="title-area">
						<li class="name">
							<h1 class="hide-for-small"><?php echo Html::anchor('/','Isherwood Athletics');?>
</h1>
						</li>
						<li class="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a></li>
					</ul>
					<section class="top-bar-section">
						<ul class="right">
							<li class="divider"></li>
							<li><?php echo Html::anchor('/','Home');?>
</li>
							<li class="divider"></li>
							<li><?php echo Html::anchor('about','About Us');?>
</li>
							<li class="divider"></li>
							<li><?php echo Html::anchor('contact','Contact');?>
</li>
							<li class="divider"></li>
							<?php if (Auth::check()) {?>
								<li class="has-dropdown">
									<?php echo Html::anchor('account','My Account');?>

									<ul class="dropdown">
										<li><?php echo Html::anchor('account/task','Tasks/Todo List');?>
</li>
										<?php if (Auth::has_access('budgets.all')) {?><li><?php echo Html::anchor('account/budget','Budget');?>
</li><?php }?>
										<li><?php echo Html::anchor('account/calendar/task','Task Calendar');?>
</li>
										<?php if (Auth::has_access('budgets.all')) {?><li><?php echo Html::anchor('account/calendar/budget','Budget Calendar');?>
</li><?php }?>
										<?php if (Auth::has_access('user_management.all')) {?><li><?php echo Html::anchor('account/children','Manage Users');?>
</li><?php }?>
										<li><?php echo Html::anchor('account/manage','Manage My Account');?>
</li>
									</ul>
								</li>
								<li class="divider"></li>
								<li><?php echo Html::anchor('auth/logout','Logout');?>
</li>
							<?php } else { ?>
								<li><?php echo Html::anchor('auth/login','Login / Register');?>
</li>
							<?php }?>
							<li class="divider hide-for-medium-down"></li>
						</ul>
					</section>
				</nav>
			</div>
		</div>
	</header>
	<div id="content" class="row">
		<div class="large-12 columns">
			<div id="errors" class="row">
				<div class="large-12 columns">
					
					<?php if (Session::get_flash('error')) {?>
						<div data-alert class="alert-box warning">
							<p>The following error(s) occured:</p>
							<ul>
								<?php echo Session::get_flash('error');?>

							</ul>
							<a href="#" class="close">&times;</a>
						</div>
					<?php }?>
					<?php if (Session::get_flash('success')) {?>
						<div data-alert class="alert-box success">
							<span><?php echo Session::get_flash('success');?>
</span>
							<a href="#" class="close">&times;</a>
						</div>
					<?php }?>
					
	<h1>Home</h1>
	<?php echo $_smarty_tpl->tpl_vars['helloworld']->value;?>


				</div>
			</div>
			<div class="row">
				<div class="large-12 columns">
					<hr />
					<p class="right">Copyright Isherwood Athletics &copy; 2013-2014</p>
					<p>Fuel Version: <?php echo Fuel::VERSION;?>
</p>
				</div>
			</div>
		</div>
	</div>
	<?php echo Asset::js(array('jquery.js','foundation.min.js','foundation/foundation.js','foundation/foundation.abide.js','foundation/foundation.accordion.js','foundation/foundation.alert.js','foundation/foundation.clearing.js','foundation/foundation.dropdown.js','foundation/foundation.interchange.js','foundation/foundation.joyride.js','foundation/foundation.magellan.js','foundation/foundation.offcanvas.js','foundation/foundation.orbit.js','foundation/foundation.reveal.js','foundation/foundation.tab.js','foundation/foundation.tooltip.js','foundation/foundation.topbar.js','responsive-tables.js'));?>

	<script>
		$(document).foundation();
	</script>
</body>
</html>
<?php }} ?>
