{extends file="../template.tpl"}
{block name="content"}
	<h2>Manage Users</h2>
	<hr />
	<table width="100%">
		<thead>
			<tr>
				<th>User&nbsp;ID</th>
				<th>Username</th>
				<th>Email</th>
				<th>Created</th>
				<th>Last Updated</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			{foreach from=$users item=user}
				<tr>
					<td>{$user['id']}</td>
					<td>{$user['username']}</td>
					<td>{$user['email']}</td>
					<td>{$user['created_at']|date_format:"%d/%m/%y, %H:%M"}</td>
					<td>{$user['updated_at']|date_format:"%d/%m/%y, %H:%M"}</td>
					<td>
						<form method="post" style="margin: 0;">
						<input type="hidden" name="user_id" value="{$user['id']}">
						{if $user['group'] == 2}
							<input type="submit" name="submit" value="Revoke Admin" class="button tiny" style="margin: 0;">
						{else}
							<input type="submit" name="submit" value="Make Admin" class="button tiny" style="margin: 0;">
						{/if}
						</form>
					</td>
				</tr>
			{/foreach}
		</tbody>
	</table>
{/block}