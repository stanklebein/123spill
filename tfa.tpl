{include file='header.tpl'}
{include file='navbar.tpl'}

<h2>{$TWO_FACTOR_AUTH}</h2>

{if isset($ERRORS)}
	<div class="alert alert-danger">
		{$ERRORR}
	</div>
{/if}

<div class="card-body">
	<div class="row justify-content-center">
		<div class="col-lg-6">
			<form action="" method="post" id="form-tfa">
				<div class="form-group">
					<label for="input_email">{$TFA_ENTER_CODE}</label>
					<input type="text" name="tfa_code" class="form-control" id="input_email">
				</div>
				<div class="form-actions">
					<input type="submit" class="btn btn-primary" value="{$SUBMIT}">
					<input type="hidden" name="tfa" value="true">
					<input type="hidden" name="token" value="{$TOKEN}">
				</div>
			</form>
		</div>
	</div>
</div>

{include file='footer.tpl'}