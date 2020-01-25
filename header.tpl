<!DOCTYPE html>

<html language="{($smarty.const.HTML_LANG) ? $smarty.const.HTML_LANG : 'en'}"{($smarty.const.HTML_CLASS) ? ' ' + $smarty.const.HTML_CLASS : ''}{($smarty.const.HTML_RTL) ?  ' dir="rtl"' : ''}>

	<head>
	
		<meta charset="{($smarty.const.LANG_CHARSET) ? $smarty.const.LANG_CHARSET : 'utf-8'}">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

		<title>{$TITLE} &bull; {($CSM.siteTitle) ? $CSM.siteTitle : $smarty.const.SITE_NAME}</title>
	
		<meta name="author" content="{($CSM.siteTitle) ? $CSM.siteTitle : $smarty.const.SITE_NAME}">
		<meta name="description" content="{($PAGE_DESCRIPTION) ? $PAGE_DESCRIPTION : $CSM.siteDescription}">
		<meta name="keywords" content="{($PAGE_KEYWORDS) ? $PAGE_KEYWORDS : ''}">
	
		<meta property="og:title" content="{$TITLE} &bull; {($CSM.siteTitle) ? $CSM.siteTitle : $smarty.const.SITE_NAME}">
		<meta property="og:type" content="website">
		<meta property="og:url" content="{$OG_URL}">
		<meta property="og:image" content="{$CSM.siteImage}">
		<meta property="og:description" content="{($PAGE_DESCRIPTION) ? $PAGE_DESCRIPTION : $CSM.siteDescription}">

		<link rel="icon" type="image/png" href="{$CSM.siteFavicon}">
	
		{foreach from=$TEMPLATE_CSS item=css}
			{$css}
		{/foreach}
	
	</head>

	<body class="{$CSM.classes}" id="page-{(is_numeric($smarty.const.PAGE)) ? $TITLE : $smarty.const.PAGE}">
	
		{if ($CSM.particles)}
			<div class="particles" id="particles"></div>
		{/if}