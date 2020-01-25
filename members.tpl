{include file='header.tpl'}
{include file='navbar.tpl'}

<h2>Members</h2>

<ul class="nav nav-tabs mb-3">
	<li class="nav-item">
		<a href="{$ALL_LINK}" class="nav-link">{$DISPLAY_ALL}</a>
	</li>
	{foreach from=$GROUPS item=groups}
		<li class="nav-item">
			<a href="{$groups.grouplink}" class="nav-link">{$groups.groupname}</a>
		</li>
	{/foreach}
</ul>

<table class="table dataTables-users">
	<thead>
		<tr>
			<th>{$USERNAME}</th>
			<th>{$GROUP}</th>
			<th class="text-right">{$CREATED}</th>
		</tr>
	</thead>
	<colgroup>
		<col width="40%">
		<col width="30%">
		<col width="30%">
	</colgroup>
	<tbody>
		{foreach from=$MEMBERS item=member}
			<tr>
				<td>
					<div class="user-item">
						<div class="user-avatar">
							<a href="{$member.profile}">
								<img src="{$member.avatar}" alt="{$member.nickname}">
							</a>
						</div>
						<div class="user-content">
							<a href="{$member.profile}" style="color:{$member.group_colour};">{$member.nickname}</a>
						</div>
					</div>
				</td>
				<td>{$member.group}</td>
				<td class="text-right">{$member.joined}</td>
			</tr>
		{/foreach}
	</tbody>
</table>

{include file='footer.tpl'}