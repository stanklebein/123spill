{include file='header.tpl'}
{include file='navbar.tpl'}

<h2>{$404_TITLE} {$CONTENT}</h2>

<div class="card-body">
	{$ERROR}
	<br><br>
	<button class="btn btn-default" onclick="javascript: history.go(-1);">{$BACK}</button>
	<a href="{$SITE_HOME}" class="btn btn-primary ml-2">{$HOME}</a>
</div>

{include file='footer.tpl'}