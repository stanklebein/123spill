					</div>
				</div>

				{if isset($GLOBAL_WARNING_TITLE)}
					<div class="modal fade show-punishment" id="modal-acknowledge">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<div class="modal-title">{$GLOBAL_WARNING_TITLE}</div>
								</div>
								<div class="modal-body">
									{$GLOBAL_WARNING_REASON}
								</div>
								<div class="modal-footer">
									<a href="{$GLOBAL_WARNING_ACKNOWLEDGE_LINK}" class="btn btn-warning btn-sm">{$GLOBAL_WARNING_ACKNOWLEDGE}</a>
								</div>
							</div>
						</div>
					</div>
				{/if}

			</div>

			<footer class="footer">
				<div class="footer-extra">
					<div class="container">
						<div class="footer-links">
							{if ($CSM.particles)}
								<a href="#" id="toggleParticles">{$CSM.toggleParticles}</a>
							{/if}
							{foreach from=$FOOTER_NAVIGATION item=link}
								{if empty($link.items)}
									<a href="{$link.link}" target="{$link.target}">{$link.icon} {$link.title}</a>
								{else}
									<div class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown">{$link.icon} {$link.title}</a>
										<div class="dropdown-menu">
											{foreach from=$link.items item=dropdown}
												<a href="{$dropdown.link}" target="{$dropdown.target}" class="dropdown-item">{$dropdown.icon} {$dropdown.title}</a>
											{/foreach}
										</div>
									</div>
								{/if}
							{/foreach}
							<a href="{$TERMS_LINK}">{$TERMS_TEXT}</a>
							<a href="{$PRIVACY_LINK}">{$PRIVACY_TEXT}</a>
						</div>
						<div class="footer-social">
							{foreach from=$SOCIAL_MEDIA_ICONS item=icon}
								<a href="{$icon.link}" target="_blank">
									<i class="{($icon.long == "envelope") ? 'fas' : 'fab'} fa-{$icon.long}-square"></i>
								</a>
							{/foreach}
						</div>
					</div>
				</div>
				<div class="footer-content">
					<div class="container">
						{$CSM.footerContent}
						{if ($PAGE_LOAD_TIME)}
							<div class="loading-time"></div>
						{/if}
					</div>
				</div>
			</footer>

		</div>
		
		{foreach from=$TEMPLATE_JS item=script}
			{$script}
		{/foreach}
		
		{if (isset($NEW_UPDATE) && $NEW_UPDATE_URGENT !== true)}
			<script src="{$CSM.template.path}/assets/js/update.js"></script>
		{/if}

	</body>
</html>