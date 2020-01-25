{include file='header.tpl'}
{include file='navbar.tpl'}

<h2>{$NOT_FOUND}</h2>

<div class="card-body">
	<button class="btn btn-default" onclick="javascript: history.go(-1);">{$BACK}</button>
	<a href="{$SITE_HOME}" class="btn btn-primary ml-2">{$HOME}</a>
</div>

{include file='footer.tpl'}