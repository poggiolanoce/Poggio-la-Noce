<?php

// The site url
define('SITE_URL', "https://" . $_SERVER['SERVER_NAME'] . '/');

// The site basepath
define('BASEPATH', realpath(CRAFT_BASE_PATH . '/../') . '/');

return array(
  '*' => array(
    'generateTransformsBeforePageLoad' => true,
    'autoLoginAfterAccountActivation' => true,
    'enableTemplateCaching' => false,
    'devMode' => true,
    'tokenParam' => 'craftToken',
    'omitScriptNameInUrls' => true,
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

