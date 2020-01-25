{include file='header.tpl'}
{include file='navbar.tpl'}

<h2>
	{$FORGOT_PASSWORD}
	<div class="meta">
		{$ENTER_NEW_PASSWORD}
	</div>
</h2>

{if count($ERROR)}
	<div class="alert alert-danger">
		{foreach from=$ERROR item=error}
			<li>{$error}</li>
		{/foreach}
	</div>
{/if}

<div class="card-body">
	<div class="row justify-content-center">
		<div class="col-lg-6">
			<form action="" method="post" id="form-changePassword">
				<div class="form-group">
					<label for="inputEmail">{$EMAIL_ADDRESS}</label>
					<input type="email" name="email" class="form-control" id="inputEmail">
				</div>
				<div class="form-group">
					<label for="inputPassword">{$PASSWORD}</label>
					<input type="password" name="password" class="form-control" id="inputPassword">
				</div
				<div class="form-group">
					<label for="inputPasswordAgain">{$PASSWORD}</label>
					<input type="password" name="password_again" class="form-control" id="inputPasswordAgain">
				</div>
				<div class="form-actions">
					<input type="submit" class="btn btn-primary" value="{$SUBMIT}">
					<input type="hidden" name="token" value="{$TOKEN}">
				</div>
			</form>
		</div>
	</div>
</div>

{include file='footer.tpl'}