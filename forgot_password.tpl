{include file='header.tpl'}
{include file='navbar.tpl'}

<h2>
	{$FORGOT_PASSWORD}
	<div class="meta">
		{$FORGOT_PASSWORD_INSTRUCTIONS}
	</div>
</h2>

{if isset($ERROR)}
	<div class="alert alert-danger">
		{$ERROR}
	</div>
{/if}

{if isset($SUCCESS)}
	<div class="alert alert-success">
		{$SUCCESS}
	</div>
{/if}

<div class="card-body">
	<div class="row justify-content-center">
		<div class="col-md-6">
			<form action="" method="post" id="form-forgotPassword">
				<div class="form-group">
					<label for="inputEmail">{$EMAIL_ADDRESS}</label>
					<input type="email" name="email" class="form-control" id="inputEmail">
				</div>
				<div class="form-actions">
        			<input type="submit" class="btn btn-md btn-primary" value="{$SUBMIT}">
        			<input type="hidden" name="token" value="{$TOKEN}">
				</div>
			</form>
		</div>
	</div>
</div>

{include file='footer.tpl'}