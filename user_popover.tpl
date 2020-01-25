<div class="user-popover">

	<div class="user-popover-header">

		<div class="user-avatar">
			<a href="{$PROFILE}">
				<img src="{$AVATAR}" alt="{$USERNAME}">
			</a>
		</div>

		<div class="user-content">
			<a href="{$PROFILE}">{$NICKNAME}</a>
			{if count($GROUPS)}
				<div>
					{foreach from=$GROUPS item=group}
						{$group}
					{/foreach}
				</div>
			{else}
				<span class="badge badge-secondary">{$GUEST}</span>
			{/if}
		</div>

	</div>

	{if isset($REGISTERED)}
		<div class="user-popover-body">
			<div class="pairs">
				<dl>
					<dt>{$REGISTERED|regex_replace:'/[:].*/':''}:</dt>
					<dd>{$REGISTERED|regex_replace:'/^[^:]+:\s*/':''}</dd>
				</dl>
				{if isset($TOPICS) && isset($POSTS)}
					<dl>
						<dt>{$TOPICS|regex_replace:'/[0-9]+/':''|capitalize}:</dt>
						<dd>{$TOPICS|regex_replace:'/[^0-9]+/':''}</dd>
					</dl>
					<dl>
						<dt>{$POSTS|regex_replace:'/[0-9]+/':''|capitalize}:</dt>
						<dd>{$POSTS|regex_replace:'/[^0-9]+/':''}</dd>
					</dl>
				{/if}
			</div>
		</div>
	{/if}

</div>