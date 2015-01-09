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
  ),
  'craft.com' => array(
      'siteUrl' => array(
          'en_us' => 'http://example.com/en/',
          'it' => 'http://example.com/it/',
      ),
  )
);
