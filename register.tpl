{include file='header.tpl'}
{include file='navbar.tpl'}

<h2>{$CREATE_AN_ACCOUNT}</h2>

{if count($REGISTRATION_ERROR)}
	<div class="alert alert-danger">
		{foreach from=$REGISTRATION_ERROR item=error}
			<li>{$error}</li>
		{/foreach}
	</div>
{/if}

<div class="card-body">
	<div class="row justify-content-center">
		<div class="col-lg-6">
			<form action="" method="post" id="form-registeration">
				 {if isset($NICKNAMES)}
				 	<div class="form-group">
						<label for="username">{$NICKNAME}</label>
						<input type="text" name="{(isset($MINECRAFT)) ? 'nickname' : 'username'}" class="form-control" id="username">
					</div>
				 	{if isset($MINECRAFT)}
						<div class="form-group">
							<label for="username">{$MINECRAFT_USERNAME}</label>
							<input type="text" name="username" class="form-control" id="mcname">
						</div>
					{/if}
				 {else}
				 	{if isset($MINECRAFT)}
						<div class="form-group">
							<label for="mcname">{$MINECRAFT_USERNAME}</label>
							<input type="text" name="username" class="form-control" id="mcname">
						</div>
					{else}
						<div class="form-group">
							<label for="mcname">{$NICKNAME}</label>
							<input type="text" name="username" class="form-control" id="mcname">
						</div>
					{/if}
				 {/if}
				<div class="form-group">
					<label for="email">{$EMAIL}</label>
					<input type="email" name="email" class="form-control" id="email">
				</div>
				<div class="form-group">
					<label for="password">{$PASSWORD}</label>
					<input type="password" name="password" class="form-control" id="password">
				</div>
				<div class="form-group">
					<label for="password_again">{$CONFIRM_PASSWORD}</label>
					<input type="password" name="password_again" class="form-control" id="password_again">
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
					<input type="submit" class="btn btn-primary" value="{$REGISTER}">
					<input type="hidden" name="token" value="{$TOKEN}">
				</div>
			</form>
		</div>
	</div>
</div>

{include file='footer.tpl'}