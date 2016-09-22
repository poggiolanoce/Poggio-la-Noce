<?php

/**
 * Database Configuration
 *
 * All of your system's database configuration settings go in here.
 * You can see a list of the default settings in craft/app/etc/config/defaults/db.php
 */

return array(
	'*' => array(
		'server' => '127.0.0.1',
		'user' => 'root',
		'password' => '',
		'database' => 'poggia',
		'tablePrefix' => 'craft'
  ),
	'.com' => array(
          'server' => '*',
                'user' => 'root',
                'password' => 'vAtQ4hY2aL',
                'database' => 'poggio',
                'tablePrefix' => 'craft'
  )
);

