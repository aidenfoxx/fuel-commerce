{extends file="../template.tpl"}
{block name="content"}
	<h2>Personal Information</h2>
	<hr />
	<div class="row">
		<div class="large-7 columns">	
			<fieldset>
				<legend>My Details</legend>
				<form method="post">
					<label for="fullname">Full Name:</label>
					<input type="text" id="fullname" name="fullname" value="{if Input::post('fullname')}{Input::post('fullname')}{else}{Auth::get_profile_fields('fullname')}{/if}">
					<label for="confirm">Current Password:&nbsp;*</label>
					<input type="password" id="confirm" name="confirm">
					<label for="new_password">New Password:</label>
					<input type="password" id="new_password" name="new_password">
					<label for="email">Email Address:</label>
					<input type="text" id="email" name="email" value="{if Input::post('email')}{Input::post('email')}{else}{Auth::get('email')}{/if}">
					<ul class="button-group">
			  			<li><input type="submit" name="submit" value="Register" class="tiny button"></li>
						<li><input type="reset" value="Clear" class="tiny button secondary"></li>
					</ul>
				</form>
			</fieldset>
		</div>
		<div class="large-5 columns">
			<fieldset>
				<legend>User Information</legend>
				<p>To update your details, modify the information in the left form to your most recent details and submit.</p>
				<p>* Your current password is required before any details will be updated.</p>
			</fieldset>
		</div>
	</div>
{/block}