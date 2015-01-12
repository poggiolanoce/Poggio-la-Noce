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
        'siteUrl'        => 'http://craft.dev/',
        'fileSystemPath' => '/Users/andy/Sites/poggio/'
      )
  ),
  'craft.com' => array(
      'siteUrl' => array(
          'en_us' => 'http://example.com/en/',
          'it' => 'http://example.com/it/',
      ),
      'environmentVariables' => array(
        'siteUrl'        => 'http://craft.com/',
        'fileSystemPath' => '/craft/'
      )
  )
);
