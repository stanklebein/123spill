{include file='header.tpl'}
{include file='navbar.tpl'}

{if isset($HOME_SESSION_FLASH)}
	<div class="alert alert-info">
		{$HOME_SESSION_FLASH}
	</div>
{/if}

{if isset($HOME_SESSION_ERROR_FLASH)}
	<div class="alert alert-danger">
		{$HOME_SESSION_ERROR_FLASH}
	</div>
{/if}

{if count($NEWS)}
	{foreach from=$NEWS item=item}
		<div class="card card-primary" id="newsPost-{$item.id}">
			<div class="card-header">
				<a href="{$item.url}">{$item.title}</a>
				{if isset($item.label)}
					<div class="news-label">{$item.label}</div>
				{/if}
			</div>
			<div class="card-body">
				<div class="meta">
					<div class="news-meta">
						<a href="{$item.author_url}" class="news-avatar">
							<img src="{$item.author_avatar}" alt="{$item.author_name}">
						</a>
						<span>
							<a href="{$item.author_url}" style="{$item.author_style}" data-poload="{$USER_INFO_URL}{$item.author_id}">{$item.author_name}</a>
							&bull;
							<span data-toggle="tooltip" title="{$item.date}">{$item.time_ago}</span>
						</span>
					</div>
					<div class="news-stats">
						<i class="fas fa-eye fa-fw"></i> {$item.views}
						<i class="fas fa-comments fa-fw"></i> {$item.replies}
					</div>
				</div>
				<div class="date-block">
					<div class="date">{$item.date|date_format:"%d"}</div>
					<div class="month">{$item.date|date_format:"%b"}</div>
				</div>
				<div class="post">
					{$item.content}
				</div>
			</div>
			<div class="card-footer">
				<a href="{$item.url}" class="btn btn-primary btn-sm">{$READ_FULL_POST}</a>
			</div>
		</div>
	{/foreach}
{else}
	<div class="alert alert-danger">
		{$CSM.noNewsPosts}
	</div>
{/if}

{include file='footer.tpl'}

