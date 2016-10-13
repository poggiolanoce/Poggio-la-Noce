<?php

// Ensure our urls have the right scheme
define('URI_SCHEME', ( isset($_SERVER['HTTPS'] ) ) ? "https://" : "http://" );

// The site url
define('SITE_URL', URI_SCHEME . $_SERVER['SERVER_NAME'] . '/');

// The site basepath
define('BASEPATH', realpath(CRAFT_BASE_PATH . '/../') . '/');

return array(
  '*' => array(
    'generateTransformsBeforePageLoad' => true,
    'autoLoginAfterAccountActivation' => true,
    'enableTemplateCaching' => false,
    'devMode'   => true,
    'environmentVariables' => array(
        'siteUrl'  => SITE_URL,
        'basePath' => BASEPATH
    ),
    'siteUrl' => array(
      'en_us' => SITE_URL . 'en/',
      'it' => SITE_URL . 'it/'
    )
  ),
  '.com' => array(
    'enableTemplateCaching' => true,
    'devMode'   => false
  )
);

