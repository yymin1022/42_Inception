#!/bin/bash

if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else
	curl http://wordpress.org/latest.tar.gz -o latest.tar.gz
	tar -xzvf latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress

	sed -i "s/username_here/$DB_USER/g" wp-config-sample.php
	sed -i "s/password_here/$DB_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$DB_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$DB_NAME/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php
fi

exec "$@"
