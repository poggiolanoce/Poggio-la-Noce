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
  'craft.dev' => array(
      'siteUrl' => array(
          'en_us' => 'http://craft.dev/en/',
          'it' => 'http://craft.dev/it/',
      ),
      'environmentVariables' => array(
        'siteUrl'        => 'http://craft.dev',
        'fileSystemPath' => '/Users/nimwunnan/Sites/poggio/'
      )
  ),
  '.com' => array(
//      'siteUrl' => array(
 //       'en_us' => 'http://poggiolanoce.com.s202594.gridserver.com/en/',
  //        'it' => 'http://poggiolanoce.com.s202594.gridserver.com/it/',
    //  ),
      'environmentVariables' => array(
        'siteUrl'        => 'http://www.poggiolanoce.com',
        'fileSystemPath' => '/home/202594/domains/poggiolanoce.com'
      )
  )
);

