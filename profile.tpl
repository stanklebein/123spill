{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="profile-header" style="background: url('{$BANNER}') no-repeat center center / cover;">
	<div class="profile-banner">
		{if isset($LOGGED_IN)}
			<div class="profile-actions">
				{if isset($SELF)}
        			<a href="{$SETTINGS_LINK}">
						<i class="fas fa-cogs fa-fw" data-toggle="tooltip" title="Profile Settings"></i>
					</a>
					<a href="#" data-toggle="modal" data-target="#modal-profileBanner">
						<i class="fas fa-image fa-fw" data-toggle="tooltip" title="{$CHANGE_BANNER}"></i>
					</a>
				{else}
					{if ($MOD_OR_ADMIN !== true)}
						<a href="#" data-toggle="modal" data-target="#modal-profileBlock">
							<i class="fas fa-gavel fa-fw" data-toggle="tooltip" title="{(isset($BLOCK_USER)) ? $BLOCK_USER : $UNBLOCK_USER}"></i>
						</a>
					{/if}
					<a href="{$MESSAGE_LINK}">
						<i class="fas fa-envelope" data-toggle="tooltip" title="Message"></i>
					</a>
					{if isset($RESET_PROFILE_BANNER)}
						<a href="{$RESET_PROFILE_BANNER_LINK}">
							<i class="fas fa-image fa-fw" data-toggle="tooltip" title="{$RESET_PROFILE_BANNER}"></i>
						</a>
					{/if}
					{if isset($FRIENDS)}
						<a href="#" onclick="$('#form-profileFriend').submit();">
							<span data-toggle="tooltip" title="{$FRIEND.text}">{$FRIEND.icon}</span>
						</a>
						<form action="" method="post" id="form-profileFriend">
							<input type="hidden" name="token" value="{$TOKEN}">
							<input type="hidden" name="action" value="{$FRIEND.action}">
						</form>
					{/if}
				{/if}
			</div>
		{/if}
		<div class="profile-avatar">
			<img src="{$AVATAR}" alt="{$USERNAME}">
		</div>
	</div>
	<div class="profile-info">
		<div class="profile-content">
			<div class="profile-name">
				{$NICKNAME}
			</div>
			{if !empty($USER_TITLE)}
				<div class="profile-title">
					{$USER_TITLE}
				</div>
			{/if}
			{if count($GROUPS)}
				<div class="profile-groups">
					{foreach from=$GROUPS item=group}
						{$group}
					{/foreach}
				</div>
			{/if}
		</div>
	</div>
	{if ($CAN_VIEW == 1)}
		<ul class="nav nav-tabs">
			<li class="nav-item">
				<a href="#feed" class="nav-link active" data-toggle="tab">{$FEED}</a>
			</li>
			<li class="nav-item">
				<a href="#about" class="nav-link" data-toggle="tab">{$ABOUT}</a>
			</li>
			{foreach from=$TABS item=tab key=key}
				<li class="nav-item">
					<a href="#{$key}" class="nav-link" data-toggle="tab">{$tab.title}</a>
				</li>
			{/foreach}
		</ul>
	{/if}
</div>

{if isset($SUCCESS)}
	<div class="alert alert-success">
		{$SUCCESS}
	</div>
{/if}

{if isset($ERROR)}
	<div class="alert alert-danger">
		{$ERROR}
	</div>
{/if}

{if ($CAN_VIEW == 1)}
	<div class="tab-content">
		<div class="tab-pane active" id="feed">
			{if isset($LOGGED_IN)}
				<div class="card-body">
					<div class="message">
						<div class="message-icon">
							<a href="{$LOGGED_IN_USER.profile}">
								<img src="{$LOGGED_IN_USER.avatar}" alt="{$LOGGED_IN_USER.nickname}">
							</a>
						</div>
						<div class="message-content">
							<div class="message-post">
								<form action="" method="post" id="form-profilePostNew">
									<div class="form-group">
										<textarea name="post" class="form-control" placeholder="{$POST_ON_WALL}"></textarea>
									</div>
									<div class="form-actions">
										<input type="submit" class="btn btn-primary" value="{$SUBMIT}">
										<input type="hidden" name="action" value="new_post">
										<input type="hidden" name="token" value="{$TOKEN}">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			{/if}
			{if count($WALL_POSTS)}
				<div class="card-body">
					{foreach from=$WALL_POSTS item=post name=name}
						<div class="message" id="profilePost-{$post.id}">
							<div class="message-icon">
								<a href="{$post.profile}">
									<img src="{$post.avatar}" alt="{$post.nickname}">
								</a>
							</div>
							<div class="message-content">
								<div class="message-title">
									<a href="{$post.profile}" style="{$post.user_style}" data-poload="{$USER_INFO_URL}{$post.user_id}">{$post.nickname}</a>
								</div>
								<div class="message-post">
									{$post.content}
								</div>
								<div class="meta">
									<span data-toggle="tooltip" title="{$post.date}">{$post.date_rough|ucfirst}</span>
									<div class="message-actions">
										<li>
											<a{if ($post.reactions_link !== '#')} href="{$post.reactions_link}"{/if}{if count($post.reactions.reactions)} data-toggle="tooltip" title="
												{foreach from=$post.reactions.reactions item=reaction name=name}
													{$reaction.nickname}{if (!$smarty.foreach.name.last)}, {/if}
												{/foreach}
											"{/if}>{$post.reactions.count|ucfirst}</a>
										</li>
										<li>
											{if ($CSM.nestedReplies) && !isset($LOGGED_IN)}
												<a>{$post.replies.count|ucfirst}</a>
											{else}
												<a href="#" data-toggle="modal" data-target="#modal-profilePostReplies-{$post.id}">{$post.replies.count|ucfirst}</a>
											{/if}
										</li>
										{if ($CAN_MODERATE == 1 || $post.self == 1)}
											<li>
												<a href="#" data-toggle="modal" data-target="#modal-profilePostEdit-{$post.id}">{$EDIT}</a>
											</li>
											<li>
												<form action="" method="post" id="form-profilePostDelete-{$post.id}">
													<a href="#" onclick="{literal}if(confirm(confirmDelete)){$(this).closest('form').submit();}{/literal}">{$DELETE}</a>
													<input type="hidden" name="post_id" value="{$post.id}">
													<input type="hidden" name="action" value="delete">
													<input type="hidden" name="token" value="{$TOKEN}">
												</form>
											</li>
										{/if}
									</div>
								</div>
							</div>
						</div>
						{if ($CSM.nestedReplies) && count($post.replies.replies)}
							<div class="mesage-replies" style="margin-left: 50px;">
								{foreach from=$post.replies.replies item=reply}
									<hr>
									<div class="message" id="profilePostReply-{$reply.id}">
										<div class="message-icon">
											<a href="{$reply.profile}">
												<img src="{$reply.avatar}" alt="{$reply.nickname}">
											</a>
										</div>
										<div class="message-content">
											<div class="message-title">
												<a href="{$reply.profile}" style="{$reply.style}" data-poload="{$USER_INFO_URL}{$reply.user_id}">{$reply.nickname}</a>
											</div>
											<div class="message-post">
												{$reply.content}
											</div>
											<div class="meta">
												<span data-toggle="tooltip" title="{$reply.time_full}">{$reply.time_friendly}</span>
												{if ($CAN_MODERATE == 1 || $post.self == 1)}
													<div class="message-actions">
														<li>
															<form action="" method="post" id="from-profilePostReplyDelete-{$reply.id}">
																<a href="#" onclick="if(confirm(confirmDelete))$(this).closest('form').submit();">{$DELETE}</a>
																<input type="hidden" name="token" value="{$TOKEN}">
																<input type="hidden" name="post_id" value="{$reply.id}">
																<input type="hidden" name="action" value="deleteReply">
															</form>
														</li>
													</div>
												{/if}
											</div>
										</div>
									</div>
								{/foreach}
							</div>
						{/if}
						{if (!$smarty.foreach.name.last)}<hr>{/if}
					{/foreach}
				</div>
				<br>
				{$PAGINATION}
			{else}
				<div class="alert alert-danger mt-3">
					{$NO_WALL_POSTS}
				</div>
			{/if}
		</div>

		<div class="tab-pane" id="about">
			<div class="card-body">
				<div class="pairs pairs-50">
					{if isset($ABOUT_FIELDS.minecraft)}
						<dl>
							<dt>{$ABOUT_FIELDS.registered.title}</dt>
							<dd>
								<span data-toggle="tooltip" title="{$ABOUT_FIELDS.registered.tooltip}">{$ABOUT_FIELDS.registered.value}</span>
							</dd>
						</dl>
						<dl>
							<dt>{$ABOUT_FIELDS.last_seen.title}</dt>
							<dd>
								<span data-toggle="tooltip" title="{$ABOUT_FIELDS.last_seen.tooltip}">{$ABOUT_FIELDS.last_seen.value}</span>
							</dd>
						</dl>
						<dl>
							<dt>{$ABOUT_FIELDS.profile_views.title}</dt>
							<dd>{$ABOUT_FIELDS.profile_views.value}</dd>
						</dl>
					{/if}
				</div>
			</div>
			{if !isset($NO_ABOUT_FIELDS)}
				<div class="card-body">
					<div class="pairs pairs-50">
						{foreach from=$ABOUT_FIELDS item=field key=key}
							{if is_numeric($key)}
								<dl>
									<dt>{$field.title}</dt>
									<dd>{$field.value}</dd>
								</dl>
							{/if}
						{/foreach}
					</div>
				</div>
			{else}
				<div class="alert alert-danger mt-3">
					{$NO_ABOUT_FIELDS}
				</div>
			{/if}
		</div>
		{foreach from=$TABS item=tab}
			<div class="tab-pane" id="{$key}">
				{include file=$tab.include}
			</div>
		{/foreach}
	</div>
{else}
	<div class="alert alert-danger">
		{$PRIVATE_PROFILE}
	</div>
{/if}

{if ($CAN_VIEW == 1)}
	{if count($WALL_POSTS)}
		{foreach from=$WALL_POSTS item=post}
			<div class="modal fade" id="modal-profilePostReplies-{$post.id}">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<div class="modal-title">{$REPLIES_TITLE}</div>
							<a href="#" class="close" data-dismiss="modal">
								<i class="fas fa-times"></i>
							</a>
						</div>
						<div class="modal-body">
							{if (!$CSM.nestedReplies)}
								{if count($post.replies.replies)}
									{foreach from=$post.replies.replies item=reply}
										<div class="message" id="profilePostReply-{$reply.id}">
											<div class="message-icon">
												<a href="{$reply.profile}">
													<img src="{$reply.avatar}" alt="{$reply.nickname}">
												</a>
											</div>
											<div class="message-content">
												<div class="message-title">
													<a href="{$reply.profile}" style="{$reply.style}" data-poload="{$USER_INFO_URL}{$reply.user_id}">{$reply.nickname}</a>
												</div>
												<div class="message-post">
													{$reply.content}
												</div>
												<div class="meta">
													<span data-toggle="tooltip" title="{$reply.time_full}">{$reply.time_friendly}</span>
													{if ($CAN_MODERATE == 1 || $post.self == 1)}
														<div class="message-actions">
															<li>
																<form action="" method="post" id="from-profilePostReplyDelete-{$reply.id}">
																	<a href="#" onclick="if(confirm(confirmDelete))$(this).closest('form').submit();">{$DELETE}</a>
																	<input type="hidden" name="token" value="{$TOKEN}">
																	<input type="hidden" name="post_id" value="{$reply.id}">
																	<input type="hidden" name="action" value="deleteReply">
																</form>
															</li>
														</div>
													{/if}
												</div>
											</div>
										</div>
										<hr>
									{/foreach}
								{else}
									<div class="alert alert-danger alert-sm">
										{$NO_REPLIES}
									</div>
								{/if}
							{/if}
							{if isset($LOGGED_IN)}
								<div class="message">
									<div class="message-icon">
										<a href="{$LOGGED_IN_USER.profile}">
											<img src="{$LOGGED_IN_USER.avatar}" alt="{$LOGGED_IN_USER.nickname}">
										</a>
									</div>
									<div class="message-content">
										<div class="message-post">
											<form action="" method="post" id="form-profilePostReplyNew">
												<div class="form-group">
													<textarea name="reply" class="form-control" placeholder="{$NEW_REPLY}"></textarea>
												</div>
												<div class="form-actions">
													<input type="submit" class="btn btn-primary" value="{$SUBMIT}">
													<input type="hidden" name="action" value="reply">
													<input type="hidden" name="post" value="{$post.id}">
													<input type="hidden" name="token" value="{$TOKEN}">
												</div>
											</form>
										</div>
									</div>
								</div>
							{/if}
						</div>
					</div>
				</div>
			</div>
			{if ($CAN_MODERATE || $post.self)}
				<div class="modal fade" id="modal-profilePostEdit-{$post.id}">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<div class="modal-title">Editing Post by {$post.nickname}</div>
								<a href="#" class="close" data-dismiss="modal">
									<i class="fas fa-times"></i>
								</a>
							</div>
							<div class="modal-body">
								<div class="message">
									<div class="message-icon">
										<a href="{$post.profile}">
											<img src="{$post.avatar}" alt="{$post.nickname}">
										</a>
									</div>
									<div class="message-content">
										<div class="message-post">
											<form action="" method="post" id="form-profilePostEdit-{$reply.id}">
												<div class="form-group">
													<textarea name="content" class="form-control">{$post.content}</textarea>
												</div>
												<div class="form-actions">
													<input type="submit" class="btn btn-primary" value="{$SUBMIT}">
													<input type="hidden" name="post_id" value="{$post.id}">
													<input type="hidden" name="action" value="edit">
													<input type="hidden" name="token" value="{$TOKEN}">
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			{/if}
		{/foreach}
	{/if}
{/if}

{if isset($LOGGED_IN_USER)}
	{if !isset($SELF)}
		{if ($MOD_OR_ADMIN !== true)}
			<div class="modal fade" id="modal-profileBlock">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<div class="modal-title">{(isset($BLOCK_USER)) ? $BLOCK_USER : $UNBLOCK_USER}</div>
							<a href="#" class="close" data-dismiss="modal">
								<i class="fas fa-times"></i>
							</a>
						</div>
						<div class="modal-body">
							{(isset($CONFIRM_BLOCK_USER)) ? $CONFIRM_BLOCK_USER : $CONFIRM_UNBLOCK_USER}
						</div>
						<div class="modal-footer">
							<form action="" method="post" id="form-profileBlock">
								<input type="button" class="btn btn-default btn-sm" data-dismiss="modal" value="{$CANCEL}">
								<input type="submit" class="btn btn-primary btn-sm" value="{$SUBMIT}">
								<input type="hidden" name="action" value="block">
								<input type="hidden" name="token" value="{$TOKEN}">
							</form>
						</div>
					</div>
				</div>
			</div>
		{/if}
	{else}
		<div class="modal fade" id="modal-profileBanner">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<div class="modal-title">{$CHANGE_BANNER}</div>
						<a href="#" class="close" data-dismiss="modal">
							<i class="fas fa-times"></i>
						</a>
					</div>
					<div class="modal-body">
						<form action="" method="post" id="form-profileBanner">
							<select name="banner" class="image-picker masonry show-html" id="imagePicker">
								{foreach from=$BANNERS item=banner}
									<option data-img-src="{$banner.src}" value="{$banner.name}"{if $banner.active == true} selected{/if}>{$banner.name}</option>
								{/foreach}
							</select>
							<input type="hidden" name="action" value="banner">
							<input type="hidden" name="token" value="{$TOKEN}">
						</form>
						{if isset($PROFILE_BANNER)}
							<hr>
							<h4>Or {$UPLOAD_PROFILE_BANNER}</h4>
							<form action="{$UPLOAD_BANNER_URL}" method="post" enctype="multipart/form-data" id="form-profileBannerUpload">
								<div class="form-group">
									<div class="input-group">
										<div class="custom-file">
											<input type="file" name="file" class="custom-file-input" id="uploadBannerInput" onchange="$('#uploadBannerLabel').html(this.files[0].name)">
											<label for="uploadBannerInput" class="custom-file-label" id="uploadBannerLabel">Choose file</label>
										</div>
										<div class="input-group-append">
											<input type="submit" class="btn btn-success" value="{$UPLOAD}">
											<input type="hidden" name="type" value="profile_banner">
											<input type="hidden" name="token" value="{$TOKEN}">
										</div>
									</div>
								</div>
							</form>
						{/if}
					</div>
					<div class="modal-footer">
						<a href="#" class="btn btn-default btn-sm" data-dismiss="modal">{$CANCEL}</a>
						<a href="#" class="btn btn-primary btn-sm" onclick="$('#form-profileBanner').submit()">{$SUBMIT}</a>
					</div>
				</div>
			</div>
		</div>
	{/if}
{/if}

{include file='footer.tpl'}