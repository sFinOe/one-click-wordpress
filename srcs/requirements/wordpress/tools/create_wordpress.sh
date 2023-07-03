#!/bin/sh

sleep 10

if [ -f "/var/www/html/wp-config.php" ]
then 
	echo "wordpress already downloaded"
else
	mkdir -p /var/www/html
	mkdir -p /var/run
	
	cd /var/www/html
	
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	
	chmod +x wp-cli.phar
		
	mv wp-cli.phar /usr/local/bin/wp
	
	wp core download --allow-root --version=latest --force

	mv wp-config-sample.php wp-config.php

	sed -i "s/username_here/$MYSQL_USER/g" wp-config.php
		
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config.php
		
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config.php
		
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config.php
	
	wp core install \
	--allow-root \
	--url=${DOMAIN_NAME} \
	--title=\'${WORDPRESS_TITLE}\' \
	--admin_user=\'${WORDPRESS_ADMIN}\' \
	--admin_password=${WORDPRESS_MPADMIN} \
	--admin_email=${WORDPRESS_EMAIL} \
	--skip-email
	
	wp user create --allow-root --path=/var/www/html $WORPRESS_USER $WORDPRESS_EMAIL_USER --role=contributor --user_pass=$WORDPRESS_PASSWORD
	touch /var/www/html/.up
		
fi
/usr/sbin/php-fpm7.3 -F
