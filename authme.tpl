{include file='header.tpl'}
{include file='navbar.tpl'}

<h2>
	{$CONNECT_WITH_AUTHME}
	<div class="meta">
		{$AUTHME_INFO}
	</div>
</h2>

{if count($ERRORS)}
	<div class="alert alert-danger">
		{foreach from=$ERRORS item=error}
			<li>{$error}</li>
		{/foreach}
	</div>
{/if}

<div class="card-body">
	<div class="row justify-content-center">
		<div class="col-lg-6">
			<form action="" method="post" id="form-authme">
				<div class="form-group">
					<label for="inputUsername">{$USERNAME}</label>
					<input type="text" name="username" class="form-control" id="inputUsername">
				</div>
				<div class="form-group">
					<label for="inputPassword">{$PASSWORD}</label>
					<input type="password" name="password" class="form-control" id="inputPassword">
				</div>
				{if isset($RECAPTCHA)}
					<div class="form-group">
						<div class="g-recaptcha" data-sitekey="{$RECAPTCHA}"></div>
					</div>
				{/if}
				<div class="form-actions">
					<label for="t_and_c">
						<input type="checkbox" name="t_and_c" id="t_and_c" value="1">
						<span>{$AGREE_TO_TERMS}</span>
					</label>
     				<input type="submit" class="btn btn-primary" value="{$SUBMIT}">
					<input type="hidden" name="token" value="{$TOKEN}">
				</div>
			</form>
		</div>
	</div>
</div>

{include file='footer.tpl'}