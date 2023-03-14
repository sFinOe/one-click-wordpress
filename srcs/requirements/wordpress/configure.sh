#!/bin/bash

table_prefix='$table_prefix'

config="<?php
define( 'DB_NAME', '$MYSQL_DATABASE' );
define( 'DB_USER', '$MYSQL_USER' );
define( 'DB_PASSWORD', '$MYSQL_PASSWORD' );
define( 'DB_HOST', '$DB_HOST' );
define( 'DB_CHARSET', 'utf8mb4' );
define( 'DB_COLLATE', '' );
${table_prefix} = 'wp_';
define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}
require_once ABSPATH . 'wp-settings.php';"

cat /tmp/wordpress/wp-config.php

mkdir -p /var/www/wordpress && chown -R www-data:www-data /var/www/wordpress && cp -r /tmp/wordpress/* /var/www/wordpress/ && php-fpm7.3 -F