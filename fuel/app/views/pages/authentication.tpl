{extends file="../template.tpl"}
{block name="content"}
	<h2>Login/Register</h2>
	<hr />
	<div class="row">
		<div class="large-7 columns">	
			<fieldset>
				<legend>Registration</legend>
				<form method="post">
					<label for="name">Full Name:</label>
					<input type="text" id="name" name="name" value="{if isset($smarty.post.name)}{$smarty.post.name}{/if}">
					<label for="username">Username:</label>
					<input type="text" id="username" name="username" value="{if isset($smarty.post.username)}{$smarty.post.username}{/if}">
					<label for="password">Password:</label>
					<input type="password" id="password" name="password">
					<label for="password_confirm">Confirm Password:</label>
					<input type="password" id="password_confirm" name="password_confirm">
					<label for="email">Email Address:</label>
					<input type="text" id="email" name="email" value="{if isset($smarty.post.email)}{$smarty.post.email}{/if}">
					<ul class="button-group">
			  			<li><input type="submit" value="Register" class="tiny button"></li>
						<li><input type="reset" value="Clear" class="tiny button secondary"></li>
					</ul>
				</form>
			</fieldset>
		</div>
		<div class="large-5 columns">
			<fieldset>
				<legend>Login</legend>
				<form method="post" class="custom">
					<label for="username">Username/Email:</label>
					<input type="text" id="username" name="username">
					<label for="password">Password:</label>
					<input type="password" id="password" name="password">
					<p class="right">
						<label for="remember">
							<input type="checkbox" type="remember" id="remember"><span class="custom checkbox"></span> Remember me?
						</label>
					</p>
					<ul class="button-group">
			  			<li><input type="submit" value="Login" class="tiny button"></li>
						<li><input type="reset" value="Clear" class="tiny button secondary"></li>
					</ul>
				</form>
			</fieldset>
		</div>
	</div>
{/block}