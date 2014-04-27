{extends file="../template.tpl"}
{block name="content"}
	<h2>Login/Register</h2>
	<hr />
	<div class="row">
		<div class="large-7 columns">	
			<fieldset>
				<legend>Registration</legend>
				<form method="post">
					<label for="fullname">Full Name:</label>
					<input type="text" id="fullname" name="fullname" value="{Input::post('fullname')}">
					<label for="username">Username:</label>
					<input type="text" id="username" name="username" value="{Input::post('username')}">
					<label for="password">Password:</label>
					<input type="password" id="password" name="password">
					<label for="confirm">Confirm Password:</label>
					<input type="password" id="confirm" name="confirm">
					<label for="email">Email Address:</label>
					<input type="text" id="email" name="email" value="{Input::post('email')}">
					<ul class="button-group">
			  			<li><input type="submit" name="submit" value="Register" class="tiny button"></li>
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
							<input type="checkbox" type="remember" id="remember" name="remember"><span class="custom checkbox"></span> Remember me?
						</label>
					</p>
					<ul class="button-group">
			  			<li><input type="submit" name="submit" value="Login" class="tiny button"></li>
						<li><input type="reset" value="Clear" class="tiny button secondary"></li>
					</ul>
				</form>
			</fieldset>
		</div>
	</div>
{/block}