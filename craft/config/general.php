<?php

/**
 * General Configuration
 *
 * All of your system's general configuration settings go in here.
 * You can see a list of the default settings in craft/app/etc/config/defaults/general.php
 */

return array(
  '*' => array(

  ),
  'poggio.dev' => array(
    'siteUrl' => array(
      'en_us' => 'http://poggio.dev/en/',
      'it' => 'http://poggio.dev/it/',
    ),
    'environmentVariables' => array(
      'siteUrl'        => 'http://poggio.dev',
      'fileSystemPath' => '/Users/nimwunnan/Sites/poggio/'
    )
  ),
  '.com' => array(
    'siteUrl' => array(
      'en_us' => 'http://www.poggiolanoce.com/en/',
      'it' => 'http://www.poggiolanoce.com/it/',
    ),
    'environmentVariables' => array(
      'siteUrl'        => 'http://www.poggiolanoce.com',
      'fileSystemPath' => '/home/202594/domains/poggiolanoce.com'
    )
  )
);

