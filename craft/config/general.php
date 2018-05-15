<?php

// Ensure our urls have the right scheme
define('URI_SCHEME', ( isset($_SERVER['HTTPS'] ) ) ? "https://" : "http://" );

// The site url
define('SITE_URL', 'http://www.poggiolanoce.com/');

// The site basepath
define('BASEPATH', realpath(CRAFT_BASE_PATH . '/../') . '/');

return array(
  '*' => array(
    'generateTransformsBeforePageLoad' => true,
    'autoLoginAfterAccountActivation' => true,
    'enableTemplateCaching' => false,
    'devMode' => true,
    'tokenParam' => 'craftToken',
    'environmentVariables' => array(
      'siteUrl'  => SITE_URL,
      'fileSystemPath' => BASEPATH
    ),
    'siteUrl' => array(
      'en_us' => SITE_URL . 'en/',
      'it' => SITE_URL . 'it/'
    )
  ),
  '67.205.142.46' => array(
    'devMode'   => false,
  ),
  '.com' => array(
    'enableTemplateCaching' => true,
    'devMode'   => false
  )
);

