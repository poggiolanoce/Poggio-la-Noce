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
	  'server' => 'internal-db.s202594.gridserver.com',
		'user' => 'db202594',
		'password' => '@Poggio1234',
		'database' => 'db202594_craft',
		'tablePrefix' => 'craft',
  )
);

