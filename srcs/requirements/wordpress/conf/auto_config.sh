#!/bin/bash
# Attendre que la base de données soit prête
sleep 10

# Vérifier si le fichier wp-config.php existe
if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
    # Utiliser WP CLI pour créer le fichier wp-config.php
    wp config create wp config create	--allow-root \
											    --dbhost=$MARIADB_HOST \
    											--dbname=$MARIADB_NAME \
    											--dbuser=$MARIADB_USER \
    											--dbpass=$MARIADB_PASSWORD \
												--path='/var/www/wordpress'
	wp core install \
					--path=/var/www/html \
					--url=$WORDPRESS_URL \
					--title=$WORDPRESS_TITLE \
					--admin_user=$WORDPRESS_ROOT_USER \
					--admin_password=$WORDPRESS_ROOT_PASSWORD \
					--admin_email=$WORDPRESS_ROOT_EMAIL \
					--allow-root
	
	wp user create \
				$WORDPRESS_USER $WORDPRESS_USER_EMAIL \
				--user_pass=$WORDPRESS_USER_PASSWORD \
				--role=author --path=/var/www/wordpress \
				--allow-root
fi

if [ ! -d /run/php ]; then
    mkdir -p /run/php
fi