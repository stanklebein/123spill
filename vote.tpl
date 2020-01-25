{include file='header.tpl'}
{include file='navbar.tpl'}

<h2>{$VOTE_TITLE}</h2>

{if isset($MESSAGE_ENABLED)}
	<div class="alert alert-info text-center">
		{$MESSAGE}
	</div>
{/if}

<div class="card-body{if count($SITES)} pt-0{/if}">
	{if count($SITES)}
		<div class="row justify-content-center">
			{foreach from=$SITES item=site}
				<div class="col-md-4 pt-3">
					<a href="{$site.url}" target="_blank" class="btn btn-lg btn-block btn-primary" id="vote-link">{$site.name}</a>
				</div>
			{/foreach}
		</div>
	{else}
		No Vote Sites
	{/if}
</div>

{include file='footer.tpl'}