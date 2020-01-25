{include file='header.tpl'}
{include file='navbar.tpl'}

<h2>{$403_TITLE} {$CONTENT}</h2>

<div class="card-body">
	{if !isset($LOGGED_IN_USER)}
		{$CONTENT_LOGIN}
		<br><br>
	{/if}
	<button class="btn btn-default" onclick="javascript: history.go(-1);">{$BACK}</button>
	{if isset($LOGGED_IN_USER)}
		<a href="{$SITE_HOME}" class="btn btn-primary ml-2">{$HOME}</a>
	{else}
		<a href="{$LOGIN_LINK}" class="btn btn-primary ml-2">{$LOGIN}</a>
	{/if}

</div>

{include file='footer.tpl'}