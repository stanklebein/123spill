{include file='header.tpl'}
{include file='navbar.tpl'}

<h2>{$REGISTER}</h2>

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
			<form action="" method="post" id="form-completeSignup">
				<div class="form-group">
					<label for="inputPassword">{$PASSWORD}</label>
					<input type="password" name="password" class="form-control" id="inputPassword">
				</div>
				<div class="form-group">
					<label for="inputPasswordAgain">{$CONFIRM_PASSWORD}</label>
					<input type="password" name="password_again" class="form-control" id="inputPasswordAgain">
				</div>
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