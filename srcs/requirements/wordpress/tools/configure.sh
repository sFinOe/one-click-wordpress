# !/bin/bash

sleep 40

wp core download --locale=en_US --path=/tmp/wordpress --allow-root
wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$DB_HOST --path=/tmp/wordpress --allow-root --skip-check
wp core install --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_USER" --admin_password="$WP_PASSWORD" --admin_email="$WP_EMAIL" --path=/tmp/wordpress --allow-root


mkdir -p /var/www/wordpress && chown -R www-data:www-data /var/www/wordpress && cp -r /tmp/wordpress/* /var/www/wordpress/ && php-fpm7.3 -F