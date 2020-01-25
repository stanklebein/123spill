{include file='header.tpl'}
{include file='navbar.tpl'}

<h2>
	{$VERIFY_ACCOUNT}
	<div class="meta">
		{$VERIFY_ACCOUNT_HELP}
	</div>
</h2>

{if isset($ERROR)}
	<div class="alert alert-danger">
		{$ERROR}
		<a href="{$RETRY_LINK}" class="btn btn-danger btn-sm mt-2 ml-2">{$RETRY_TEXT}</a>
	</div>
{/if}

{if isset($SUCCESS)}
	<div class="alert alert-success">
		{$SUCCESS}
		<a href="{$LOGIN_LINK}" class="btn btn-primary btn-sm mt-2 ml-2">{$LOGIN_TEXT}</a>
	</div>
{/if}

{if !isset($STEP)}
	<div class="card-body">
		<div class="row justify-content-center">
			<div class="col-lg-6">
				{$MCASSOC}
			</div>
		</div>
	</div>
{/if}

{include file='footer.tpl'}