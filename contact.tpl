{include file='header.tpl'}
{include file='navbar.tpl'}

<h2>{$CONTACT}</h2>

{if isset($SUCCESS)}
	<div class="alert alert-success">
		{$SUCCESS}
	</div>
{/if}

{if isset($ERROR)}
	<div class="alert alert-danger">
		{$ERROR}
	</div>
{/if}

{if isset($ERROR_EMAIL)}
	<div class="alert alert-danger">
		{$ERROR_EMAIL}
	</div>
{/if}

{if isset($ERROR_CONTENT)}
	<div class="alert alert-danger">
		{$ERROR_CONTENT}
	</div>
{/if}

<div class="card-body">
	<div class="row justify-content-center">
		<div class="col-lg-6">
			<form action="" method="post" id="form-contact">
				<div class="form-group">
					<label for="email">{$EMAIL}</label>
					<input type="email" name="email" class="form-control" id="email">
				</div>
				<div class="form-group">
					<label for="inputMessage">{$MESSAGE}</label>
					<textarea name="content" class="form-control" id="inputMessage"></textarea>
				</div>
				{if isset($RECAPTCHA)}
					<div class="form-group">
						<div class="g-recaptcha" data-sitekey="{$RECAPTCHA}"></div>
					</div>
				{/if}
				<div class="form-actions">
					<input type="submit" class="btn btn-primary" value="{$SUBMIT}">
					<input type="hidden" name="token" value="{$TOKEN}">
				</div>
			</form>
		</div>
	</div>
</div>

{include file='footer.tpl'}