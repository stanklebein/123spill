{include file='header.tpl'}

<div class="container">
	<div class="card-body">
		<h2>{$MAINTENANCE_TITLE}</h2>
		{$MAINTENANCE_MESSAGE}
		<br><br>
		<button class="btn btn-default" onclick="window.location.reload();">{$RETRY}</button>
		{if isset($LOGIN)}
			<a href="{$LOGIN_LINK}" class="btn btn-primary ml-2">{$LOGIN}</a>
		{/if}
	</div>
</div>

</body>

</html>