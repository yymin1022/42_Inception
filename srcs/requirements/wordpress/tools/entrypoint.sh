#!/bin/bash

if [ ! -f "/var/www/html/wordpress/index.php" ]; then
	wp core download --path=/var/www/html --allow-root
	wp config create --allow-root --dbname=${DB_NAME} --dbuser=${WP_DB_USER} --dbpass=${WP_DB_PASSWORD} --dbhost=${WP_DB_HOST} --dbcharset="utf8"
	wp core install --allow-root --url=${DOMAIN_NAME} --title="yonyoo's Wordpress" --admin_user=${WP_ADMIN_NAME} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
	wp user create --allow-root ${WP_USER_NAME} ${WP_USER_EMAIL} --role=author --user_pass=${WP_USER_PASSWORD}
	wp plugin update --all --path=/var/www/html --allow-root
fi

exec php-fpm7.4 -F
