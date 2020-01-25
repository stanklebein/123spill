{include file='header.tpl'}
{include file='navbar.tpl'}

<h2>{$STATUS}</h2>

{if isset($CLICK_TO_COPY_TOOLTIP)}
	<div class="alert alert-info text-center">
		<span onclick="copy('#ip')" data-toggle="tooltip" title="{$CLICK_TO_COPY_TOOLTIP}">{$CONNECT_WITH}</span>
	</div>
{/if}

{if count($SERVERS)}
	<div class="row justify-content-center">
		{foreach from=$SERVERS item=server name=name}
			<div class="col-12 mb-3">
				<div class="card card-server" id="server" data-id="{$server->id}" data-bungee="{$server->bungee}" data-players="{$server->player_list}">
					<div class="card-header">
						<span class="indicator"></span> {$server->name|escape:'html'}
					</div>
					<div class="card-body">
						<div class="server-players">
							{$LOADING}
						</div>
						<div class="server-players-count"></div>
					</div>
				</div>
			</div>
		{/foreach}
	</div>
{else}
	<div class="alert alert-warning">
		{$NO_SERVERS}
	</div>
{/if}

{include file='footer.tpl'}