#!/bin/bash

# Démarrer le service MariaDB
service mysql start

# Attendre que MariaDB soit entièrement démarré
sleep 10

# Créer la base de données, l'utilisateur, et attribuer les droits
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

# Arrêter MariaDB proprement
mysqladmin -u root -p"$SQL_ROOT_PASSWORD" shutdown

# Démarrer MariaDB sans arrêt pour que le conteneur reste actif
exec mysqld_safe
