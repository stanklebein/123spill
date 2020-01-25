{include file='header.tpl'}
{include file='navbar.tpl'}

{if count($STAFF_GROUPS)}
	{foreach from=$STAFF_GROUPS item=group}
		{if count($group.members)}
			<div class="card card-staff">
				<div class="card-header" style="background: {$group.style};">
					{$group.name}
				</div>
				<div class="card-body">
					<div class="staff-list">
						{foreach from=$group.members item=member}
							<div class="staff-item">
								<div class="staff-avatar">
									<a href="{$member.profile}">
										<img src="{$member.avatar}" alt="{$member.username}">
									</a>
								</div>
								<div class="staff-content">
									<a href="{$member.profile}" style="color: {$group.style};">{$member.username}</a>
									{if !empty($member.title)}
										<div class="meta">{$member.title}</div>
									{/if}
								</div>
							</div>
						{/foreach}
					</div>
				</div>
			</div>
		{/if}
	{/foreach}
{/if}

{include file='footer.tpl'}