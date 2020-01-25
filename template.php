<?php

/**
 *	CESIUM TEMPLATE
 *	By Xemah | https://xemah.com
 *
**/

class CesiumTemplate extends TemplateBase {

	private $_pages, $_smarty, $_language, $_queries, $_cache, $_user, $_csmTemplate;
	
	public function __construct($pages, $smarty, $language, $queries, $cache, $user) {

		// Initialize the 'DataFile' class
		require_once('backend/classes/DataFile.php');
		$csmDF = new CSM_DataFile;

		// Initialize the 'Util' class
		require_once('backend/classes/Util.php');
		$csmUtil = new CSM_Util;

		// Initialize the language
		$csmLanguage = new Language($csmUtil->buildPath('/language', LANGUAGE));

		// Module details
		$csmDF->load('info');
		$csmTemplate = array(
			'name' => $csmDF->get('name'),
			'author' => $csmDF->get('author'),
			'version' => $csmDF->get('version'),
			'nlVersion' => $csmDF->get('nlVersion'),
		);
		
		// Template path
		$csmTemplate['path'] = (defined('CONFIG_PATH') ? CONFIG_PATH : '') . '/custom/templates/' . $csmTemplate['name'];
		
		// Construct the template
		parent::__construct($csmTemplate['name'], $csmTemplate['version'], $csmTemplate['nlVersion'], $csmTemplate['author']);

		// Register settings page
		$this->_settings = ROOT_PATH . '/custom/templates/' . $csmTemplate['name'] . '/backend/index.php';

		// Add CSS files
		$this->addCSSFiles(array(
			$csmTemplate['path'] . '/assets/css/vendors/bootstrap.min.css' => array(),
			$csmTemplate['path'] . '/assets/css/vendors/fontawesome.min.css' => array(),
			$csmTemplate['path'] . '/assets/css/vendors/toastr.min.css' => array(),
		));

		// Add JS files
		$this->addJSFiles(array(
			$csmTemplate['path'] . '/assets/js/vendors/jquery.min.js' => array(),
			$csmTemplate['path'] . '/assets/js/vendors/popper.min.js' => array(),
			$csmTemplate['path'] . '/assets/js/vendors/bootstrap.min.js' => array(),
			$csmTemplate['path'] . '/assets/js/vendors/jquery.cookie.js' => array(),
			$csmTemplate['path'] . '/assets/js/vendors/toastr.min.js' => array(),
		));
		
		// Assign smarty variables
		$smarty->assign('FORUM_SPAM_WARNING_TITLE', $language->get('general', 'warning'));

		// Initialize files
		$this->initializeFiles($csmUtil->buildPath(''));
		
		// Assign the variables
		$this->_language = $language;
		$this->_smarty = $smarty;
		$this->_cache = $cache;
		$this->_user = $user;
		$this->_pages = $pages;

		// Assign cesium variables
		$this->_csmTemplate = $csmTemplate;
		$this->_csmDF = $csmDF;
		$this->_csmUtil = $csmUtil;
		$this->_csmLanguage = $csmLanguage;

	}
	
	public function onPageLoad() {

		// Assign the variables
		$language = $this->_language;
		$smarty = $this->_smarty;
		$cache = $this->_cache;
		$user = $this->_user;
		$pages = $this->_pages;

		// Assign cesium variables
		$csmTemplate = $this->_csmTemplate;
		$csmDF = $this->_csmDF;
		$csmUtil = $this->_csmUtil;
		$csmLanguage = $this->_csmLanguage;

		// Initialize files
		$this->initializeFiles($csmUtil->buildPath(''));

		// Add includes and generate cesium smarty variables
		$csmVars = array();
		require_once($csmUtil->buildPath('/includes/general.php'));
		require_once($csmUtil->buildPath('/includes/announcements.php'));
		require_once($csmUtil->buildPath('/includes/carousel.php'));
		require_once($csmUtil->buildPath('/includes/themes.php'));
		require_once($csmUtil->buildPath('/includes/misc.php'));
		require_once($csmUtil->buildPath('/includes/update.php'));
		require_once($csmUtil->buildPath('/includes/stylesheet.php'));

		// Add template to cesium variables
		$csmVars['template'] = $csmTemplate;
		$smarty->assign('CSM', $csmVars);
		
		// Add the stylesheet CSS
		$this->addCSSFiles(array($csmTemplate['path'] . '/assets/css/cesium.css' => array()));
		
		// Get route
		$route = (isset($_GET['route']) ? rtrim($_GET['route'], '/') : '/');

		// Generate JS variables array
		$jsVariables = array(
			'siteName' => SITE_NAME,
			'siteURL' => URL::build('/'),
			'fullSiteURL' => Util::getSelfURL() . ltrim(URL::build('/'), '/'),
			'page' => PAGE,
			'avatarSource' => Util::getAvatarSource(),
			'copied' => $language->get('general', 'copied'),
			'cookieNotice' => $language->get('general', 'cookie_notice'),
			'noMessages' => $language->get('user', 'no_messages'),
			'newMessage1' => $language->get('user', '1_new_message'),
			'newMessagesX' => $language->get('user', 'x_new_messages'),
			'noAlerts' => $language->get('user', 'no_alerts'),
			'newAlert1' => $language->get('user', '1_new_alert'),
			'newAlertsX' => $language->get('user', 'x_new_alerts'),
			'bungeeInstance' => $language->get('general', 'bungee_instance'),
			'andMoreX' => $language->get('general', 'and_x_more'),
			'noPlayersOnline' => $language->get('general', 'no_players_online'),
			'offline' => $language->get('general', 'offline'),
			'confirmDelete' => $language->get('general', 'confirm_deletion'),
			'enableParticles' => $csmLanguage->get('general', 'enableParticles'),
			'disableParticles' => $csmLanguage->get('general', 'disableParticles'),
			'confirmDelete' => $language->get('general', 'confirm_deletion'),
			'debugging' => (defined('DEBUGGING') && DEBUGGING == 1 ? '1' : '0'),
			'loggedIn' => ($user->isLoggedIn() ? '1' : '0'),
			'cookie'  => (defined('COOKIE_NOTICE') ? '1' : '0'),
			'loadingTime' => (defined('PAGE_LOADING') && PAGE_LOADING == 1 ? PAGE_LOAD_TIME : '0'),
			'route' => $route
		);

		// Add conditional CSS and JS files
		if (defined('PAGE')) {
			if (PAGE == 'cc_messaging') {
				$this->addCSSFiles(array(
					$csmTemplate['path'] . '/assets/css/vendors/bootstrap-tokenfield.min.css' => array(),
					$csmTemplate['path'] . '/assets/css/vendors/jquery-ui.min.css' => array()
				));

				$this->addJSFiles(array(
					$csmTemplate['path'] . '/assets/js/vendors/bootstrap-tokenfield.min.js' => array(),
					$csmTemplate['path'] . '/assets/js/vendors/jquery-ui.min.js' => array()
				));
			}
		}

		// Add conditional CSS and JS files
		if (strpos($route, '/forum/topic/') !== false) {
			$this->addJSFiles(array(
				$csmTemplate['path'] . '/assets/js/vendors/jquery-ui.min.js' => array()
			));
		}

		// Generate JS variables
		$JSVars = PHP_EOL;
		foreach ($jsVariables as $var => $value) {
			$JSVars .= 'var ' . $var . ' = "' . $value . '";' . PHP_EOL;
		}
		
		// Assign JS variables
		$this->addJSScript($JSVars);

		// Add particles file
		if ($csmDF->load('misc')->get('particles')) {
			$this->addJSFiles(array($csmTemplate['path'] . '/assets/js/vendors/particles.min.js' => array()));
			$this->addJSScript('
				if (window.localStorage.getItem(\'csmParticles\') !== \'0\')
					particlesJS.load(\'particles\', \'' . $csmTemplate['path'] . '/assets/particles.json\');

				if (window.localStorage.getItem(\'csmParticles\') !== \'0\')
					$(\'#toggleParticles\').html(disableParticles);
				else
					$(\'#toggleParticles\').html(enableParticles);

				$(\'#toggleParticles\').on(\'click\', function(event) {
					if (window.localStorage.getItem(\'csmParticles\') !== \'0\') {
						$(\'#toggleParticles\').html(enableParticles);
						$(\'#particles canvas\').remove();
						window.localStorage.setItem(\'csmParticles\', \'0\');
					} else {
						$(\'#toggleParticles\').html(disableParticles);
						particlesJS.load(\'particles\', \'' . $csmTemplate['path'] . '/assets/particles.json\');
						window.localStorage.setItem(\'csmParticles\', \'1\');
					}
				});
			');
		}
		
		// Add JS files
		$this->addJSFiles(array(
			$csmTemplate['path'] . '/assets/js/core.js' => array(),
			$csmTemplate['path'] . '/assets/js/user.js' => array(),
			$csmTemplate['path'] . '/assets/js/pages.js' => array(),
			$csmTemplate['path'] . '/assets/js/scripts.js' => array(),
		));
		
		// Add AJAX scripts
		foreach ($pages->getAjaxScripts() as $script) {
			$this->addJSScript('$.getJSON(\'' . $script . '\', function(data) {});');	
		}

	}

	public function initializeFiles($backendPath) {

		// Initialize storage files
		$csmStorageDir = $backendPath . '/storage';
		$csmDefaultsDir = $backendPath . '/defaults';

		if (!is_writable($csmStorageDir))
			$this->throwError('The directory <strong>' . $csmStorageDir . '</strong> is not writable.');

		$csmDefaultsFiles = scandir($csmDefaultsDir);
		foreach ($csmDefaultsFiles as $value) {

			if (is_dir($csmDefaultsDir . '/' . $value) || substr($value, 0, 1) === '.')
				continue;

			if (!file_exists($csmStorageDir . '/' . $value)) {
				if (!copy($csmDefaultsDir . '/' . $value, $csmStorageDir . '/' . $value))
					$this->throwError('Something went wrong while updating the files, please contact the author.');
			}

		}

		// Initialize theme files
		$csmThemeStorageDir = $csmStorageDir . '/themes';
		$csmThemeDefaultsDir = $csmDefaultsDir . '/themes';

		if (!is_dir($csmThemeStorageDir)) {
			if (!mkdir($csmThemeStorageDir))
				$this->throwError('Something went wrong while creating <strong>' . $csmThemeStorageDir . '</strong> directory.');
		}

		if (!file_exists($csmThemeStorageDir . '/default.json')) {
			if (!copy($csmThemeDefaultsDir . '/default.json', $csmThemeStorageDir . '/default.json'))
				$this->throwError('The directory <strong>' . $csmThemeStorageDir . '</strong> is not writable.');
		}

	}

	public function throwError($desc) {

		die('
			<h1>Cesium Template</h1>
			<p><strong>[ERROR]</strong> ' . $desc
		);

	}

}

// Create new instance of template
$template = new CesiumTemplate($pages, $smarty, $language, $queries, $cache, $user);