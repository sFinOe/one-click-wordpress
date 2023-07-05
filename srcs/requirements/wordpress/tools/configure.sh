#!/bin/bash

if [ ! -f /var/www/html/wp-config.php ]; then
	cd /var/www/html;
	wp core download --allow-root;
	mv /tmp/wp-config.php /var/www/html/
	wp core install --allow-root --url=zkasmi.42.fr --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
	wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD};
	echo "Wordpress: done!";
fi

exec "$@"