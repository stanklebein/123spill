<div id="wrapper">

	{if isset($CSM.header)}

		<header class="header"{if ($CSM.headerBackground)} style="background: url('{$CSM.headerBackground}') no-repeat center center / cover;"{/if}>
			<div class="container">
				{if ($CSM.discord)}
					<a href="{$CSM.discord.link}" class="header-discord" id="header-discord">
						<div class="discord-icon">
							<i class="fab fa-discord fa-fw"></i>
						</div>
						<div class="discord-content">
							<div class="discord-title">{$CSM.discord.joinNow}</div>
							{$CSM.discord.members}
						</div>
					</a>
				{/if}
				<div class="header-logo"{if ($CSM.discord && !$CSM.server) || (!$CSM.discord && !$CSM.server)} style="order: -1;"{/if}>
					{if ($CSM.logoURL)}
						<div class="site-logo {if ($CSM.logoAnimation)} animated{/if}{if (!$CSM.server)} mx-auto{/if}">
							<a href="{$SITE_HOME}">
								<img src="{$CSM.logoURL}" alt="{$CSM.logoAlt}">
							</a>
						</div>
					{else if ($CSM.logoAlt)}
						<div class="site-name">
							<h1>
								<a href="{$SITE_HOME}">{$CSM.logoAlt}</a>
							</h1>
						</div>
					{/if}
				</div>
				{if ($CSM.server)}
					<a href="#" class="header-server" id="header-server" onclick="copy('#ip')">
						<div class="server-icon">
							<i class="fas fa-globe fa-fw"></i>
						</div>
						<div class="server-content" id="server-content">
							<div class="server-title">
								<span id="ip">{$CSM.server.ip}</span>
							</div>
							{$CSM.server.players}
						</div>
					</a>
				{/if}
			</div>
		</header>

	{/if}

	<div class="nav-sidebar" id="nav-sidebar">
		<div class="nav-container">
			<div class="nav-header">
				<a href="{$SITE_HOME}">{$SITE_NAME}</a>
				<a href="#" class="nav-close" id="nav-close">
					<i class="fas fa-times"></i>
				</a>
			</div>
			<div class="nav-body">
				<ul class="nav-items">
					{foreach from=$NAV_LINKS item=link}
						{if empty($link.items)}
							<li class="nav-item">
								<a href="{$link.link}" target="{$link.target}" class="nav-link">{$link.icon} {$link.title}</a>
							</li>
						{else}
							{foreach from=$link.items item=item}
								<li class="nav-item">
									<a href="{$item.link}" target="{$item.target}" class="nav-link">{$item.icon} {$item.title}</a>
								</li>
							{/foreach}
						{/if}
					{/foreach}
				</ul>
			</div>
		</div>
	</div>

	{if ($CSM.navbarStyle == 'auto')}
		<nav class="navbar{if (count($NAV_LINKS) < 4)} navbar-expand-lg{elseif (count($NAV_LINKS) < 7)} navbar-expand-xl{/if}" id="navbar">
	{else if ($CSM.navbarStyle == 'full')}
		<nav class="navbar navbar-expand-lg" id="navbar">
	{else if ($CSM.navbarStyle == 'sidebar')}
		<nav class="navbar" id="navbar">
	{/if}

		<div class="container">
			<a class="navbar-toggler" id="navbar-toggler">
				<i class="fas fa-bars"></i> Menu
			</a>
			<div class="collapse navbar-collapse">
				<ul class="navbar-nav mr-auto">
					{foreach from=$NAV_LINKS item=link}
						{if empty($link.items)}
							<li class="nav-item{if isset($link.active)} active{/if}">
								<a href="{$link.link}" target="{$link.target}" class="nav-link">{$link.icon} {$link.title}</a>
							</li>
						{else}
							<div class="nav-item dropdown">
								<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">{$link.icon} {$link.title}</a>
								<div class="dropdown-menu">
									{foreach from=$link.items item=dropdown}
										<a href="{$dropdown.link}" target="{$dropdown.target}" class="dropdown-item">{$dropdown.icon} {$dropdown.title}</a>
									{/foreach}
								</div>
							</div>
						{/if}
					{/foreach}
				</ul>
			</div>
			<ul class="navbar-nav ml-auto">

				{if isset($LOGGED_IN_USER)}
					{foreach from=$USER_SECTION item=link key=key}
						{if ($key == 'alerts')}{$link.icon = '<i class="fas fa-flag"></i>'}
						{elseif ($key == 'pms')}{$link.icon = '<i class="fas fa-envelope"></i>'}
						{elseif ($key == 'panel')}{$link.icon = '<i class="fas fa-cogs"></i>'}
						{elseif ($key == 'account')}{$link.icon = '<i class="fas fa-user"></i>'}
						{else}{$item.icon = ''}{/if}
						{if empty($link.items)}
							{if (($key == 'panel' && !$CSM.panelInDropdown) || $key !== 'panel')}
								<li class="nav-item{if isset($link.active)} active{/if}">
									<a href="{$link.link}" target="{$link.target}" class="nav-link">
										{$link.icon} <span>{$link.title}</span>
									</a>
								</li>
							{/if}
						{else}
							<div class="nav-item dropdown" id="{$key}">
								<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">{$link.icon} <span>{$link.title}</span></a>
								<div class="dropdown-menu">
									<a class="dropdown-header">{$link.title}</a>
									{foreach from=$link.items item=dropdown key=dropdownKey}
										{if isset($dropdown.seperator)}
											<hr>
										{else}
											<a href="{$dropdown.link}" target="{$dropdown.target}" class="dropdown-item">{$dropdown.icon} {$dropdown.title}</a>
											{if ($dropdownKey == 'user')}
												{if ($USER_SECTION.panel && $CSM.panelInDropdown)}
													<a href="{$USER_SECTION.panel.link}" target="{$USER_SECTION.panel.target}" class="dropdown-item">{$USER_SECTION.panel.title}</a>
												{/if}
											{/if}
										{/if}
									{/foreach}
								</div>
							</div>
						{/if}
					{/foreach}
				{else}
					{if ($CSM.guestDropdown)}
						<div class="nav-item dropdown" id="guestDropdown">
							<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"><i class="fas fa-user"></i> Guest</a>
							<div class="dropdown-menu">
								<a class="dropdown-header">Guest</a>
								{foreach from=$USER_SECTION item=link key=key}
									{if empty($link.items)}
										<a href="{$link.link}" target="{$link.target}" class="dropdown-item">{$link.title}</a>
									{/if}
								{/foreach}
							</div>
						</div>
					{else}
						{foreach from=$USER_SECTION item=link key=key}
							{if ($key == 'login')}{$link.icon = '<i class="fas fa-key"></i>'}
							{elseif ($key == 'register')}{$link.icon = '<i class="fas fa-clipboard"></i>'}
							{else}{$link.icon = ''}{/if}
							{if empty($link.items)}
								<li class="nav-item{if isset($link.active)} active{/if}">
									<a href="{$link.link}" target="{$link.target}" class="nav-link">
										{$link.icon} <span>{$link.title}</span>
									</a>
								</li>
							{else}
								<div class="nav-item dropdown" id="{$key}">
									<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">{$link.icon} <span>{$link.title}</span></a>
									<div class="dropdown-menu">
										<a class="dropdown-header">{$link.title}</a>
										{foreach from=$link.items item=dropdown}
											{if isset($dropdown.seperator)}
												<hr>
											{else}
												<a href="{$dropdown.link}" target="{$dropdown.target}" class="dropdown-item">{$dropdown.icon} {$dropdown.title}</a>
											{/if}
										{/foreach}
									</div>
								</div>
							{/if}
						{/foreach}
					{/if}
				{/if}

			</ul>
		</div>
	</nav>

	<div class="container" id="index">

		{if isset($NEW_UPDATE)}
			<div class="alert alert-{($NEW_UPDATE_URGENT == true) ? 'danger' : 'info alert-dismissible'}" id="alert-update">
				{if ($NEW_UPDATE_URGENT !== true)}
					<a href="#" class="close" data-dismiss="alert">
						<i class="fas fa-times"></i>
					</a>
				{/if}
				<strong>{$NEW_UPDATE}</strong>
				<li>{$CURRENT_VERSION}</li>
				<li>{$NEW_VERSION}</li>
				<a href="{$UPDATE_LINK}" class="btn btn-info btn-sm mt-2 ml-2">{$UPDATE}</a>
			</div>
    	{/if}

		{if isset($CSM.update)}
			<div class="alert alert-info alert-dismissible">
				<a href="#" class="close" data-dismiss="alert">
					<i class="fas fa-times"></i>
				</a>
				<strong>{$CSM.update.updateAvailableTitle}</strong>
				<div class="my-1">
					{$CSM.update.updateAvailable}
				</div>
				<a href="{$CSM.update.updateLink}" class="btn btn-info btn-sm mt-2">{$CSM.update.updateNow}</a>
			</div>
    	{/if}

		{if isset($MAINTENANCE_ENABLED)}
			<div class="alert alert-danger alert-dismissible">
				<a href="#" class="close" data-dismiss="alert">
					<i class="fas fa-times"></i>
				</a>
				{$MAINTENANCE_ENABLED}
			</div>
		{/if}

		{if isset($MUST_VALIDATE_ACCOUNT)}
			<div class="alert alert-info">
				{$MUST_VALIDATE_ACCOUNT}
			</div>
		{/if}

		{if count($CSM.announcements)}
			{foreach from=$CSM.announcements item=announcement}
				<div class="announcement announcement-{$announcement.type}">
					<div class="announcement-header">{$announcement.name}</div>
					{$announcement.content}
				</div>
			{/foreach}
		{/if}

		{if count($CSM.carousel)}
			<div class="carousel slide" id="carousel" data-ride="carousel">
				<ol class="carousel-indicators">
					{foreach from=$CSM.carousel item=carouselItem name=name}
						<li data-target="#carousel" data-slide-to="{$smarty.foreach.name.iteration - 1}" {if ($smarty.foreach.name.first)}class="active"{/if}></li>
					{/foreach}
				</ol>
				<div class="carousel-inner">
					{foreach from=$CSM.carousel item=carouselItem name=name}
						<div class="carousel-item{if ($smarty.foreach.name.first)} active{/if}">
							<img src="{$carouselItem.image}" class="d-block w-100" alt="{$carouselItem.title}">
							<div class="carousel-caption d-none d-md-block">
								{if ($carouselItem.title)}
									<h5>{$carouselItem.title}</h5>
								{/if}
								{if ($carouselItem.description)}
									<p>{$carouselItem.description}</p>
								{/if}
							</div>
						</div>
					{/foreach}
				</div>
			</div>
		{/if}


		<div class="row justify-content-center">

			{if count($WIDGETS) || isset($FRIENDS) || ($smarty.const.PAGE == 'forum' && $SEARCH && $SEARCH_URL)}
				<div class="col-lg-3 order-last" id="widgets">
					<div class="row">
						{if ($smarty.const.PAGE == 'forum' && $SEARCH && $SEARCH_URL)}
							<div class="{(empty($WIDGETS)) ? 'col' : 'col-lg-12 col-md-4 col-sm-6'}" id="widget">
								<form method="post" action="{$SEARCH_URL}" id="form-forumSearch">
									<div class="form-group">
										<div class="input-group">
											<input type="text" name="forum_search" class="form-control" placeholder="{$SEARCH}">
											<input type="hidden" name="token" value="{$TOKEN}">
											<div class="input-group-append">
												<button class="btn btn-primary" type="submit">
													<i class="fas fa-search"></i>
												</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						{/if}
						{if isset($FRIENDS)}
							<div class="{(empty($WIDGETS)) ? 'col' : 'col-lg-12 col-md-4 col-sm-6'}" id="widget">
								<div class="card card-default">
									<div class="card-header">
										<i class="fas fa-users fa-fw"></i> {$FRIENDS}
									</div>
									<div class="card-body">
										{if count($FRIENDS_LIST)}
											<div class="friends-list">
												{foreach from=$FRIENDS_LIST item=friend}
													<a href="{$friend.profile}" data-toggle="tooltip" title="{$friend.nickname}">
														<img src="{$friend.avatar}" alt="{$friend.nickname}">
													</a>
												{/foreach}
											</div>
										{else}
											{$NO_FRIENDS}
										{/if}
									</div>
								</div>
							</div>
						{/if}
						{if count($WIDGETS)}
							{foreach from=$WIDGETS item=widget name=name}
								{if !empty($widget)}
									<div class="{($smarty.foreach.name.last) ? 'col' : 'col-lg-12 col-md-4 col-sm-6'}" id="widget">
										{$widget}
									</div>
								{/if}
							{/foreach}
						{/if}
					</div>
				</div>
			{/if}

			{if count($WIDGETS) || isset($FRIENDS)}
				<div class="col-lg-9">
			{else}
				<div class="col">
			{/if}
