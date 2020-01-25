{include file='header.tpl'}
{include file='navbar.tpl'}

<h2>{$SIGN_IN}</h2>

{if count($ERROR)}
	<div class="alert alert-danger">
		{foreach from=$ERROR item=error}
			<li>{$error}</li>
		{/foreach}
	</div>
{/if}

{if isset($SUCCESS)}
	<div class="alert alert-success">
		{$SUCCESS}
	</div>
{/if}

<div class="card-body">
	<div class="row justify-content-center">
		<div class="col-lg-6">
			<form action="" method="post" id="form-login">
				{if isset($EMAIL)}
					<div class="form-group">
						<label for="email">{$EMAIL}</label>
						<input type="email" name="email" class="form-control" id="email" value="{$USERNAME_INPUT}">
					</div>
				{else}
					<div class="form-group">
						<label for="username">{$USERNAME}</label>
						<input type="text" name="username" class="form-control" id="username" value="{$USERNAME_INPUT}">
					</div>
				{/if}
				<div class="form-group">
					<label for="password">{$PASSWORD}</label>
					<input type="password" name="password" class="form-control" id="password">
					<a href="{$FORGOT_PASSWORD_URL}" class="meta">{$FORGOT_PASSWORD}</a>
				</div>
				{if isset($RECAPTCHA)}
					<div class="form-group">
						<div class="g-recaptcha" data-sitekey="{$RECAPTCHA}"></div>
					</div>
				{/if}
				<div class="form-actions">
					<label for="remember">
						<input type="checkbox" name="remember" id="remember" value="1">
						<span>{$REMEMBER_ME}</span>
					</label>
					<input type="submit" class="btn btn-primary" value="{$SIGN_IN}">
					<input type="hidden" name="token" value="{$FORM_TOKEN}">
				</div>
			</form>
		</div>
	</div>
</div>

{include file='footer.tpl'}