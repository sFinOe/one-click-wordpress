#!/bin/sh

# mysql_install_db : is used to create the initial database and system tables for the MariaDB server.

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then 
    echo "Database already exists"
else
    mysql_install_db
    service mysql start

    config="CREATE USER IF NOT EXISTS root@localhost IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
SET PASSWORD FOR root@localhost = PASSWORD('$MYSQL_ROOT_PASSWORD');
GRANT ALL ON *.* TO root@localhost WITH GRANT OPTION;
CREATE USER IF NOT EXISTS root@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
SET PASSWORD FOR root@'%' = PASSWORD('$MYSQL_ROOT_PASSWORD');
GRANT ALL ON *.* TO root@'%' WITH GRANT OPTION;
CREATE USER IF NOT EXISTS $MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
SET PASSWORD FOR $MYSQL_USER@'%' = PASSWORD('$MYSQL_PASSWORD');
CREATE USER IF NOT EXISTS $MYSQL_USER@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';
SET PASSWORD FOR $MYSQL_USER@'localhost' = PASSWORD('$MYSQL_PASSWORD');
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
GRANT ALL ON $MYSQL_DATABASE.* TO $MYSQL_USER@'%';" 

    echo "$config" > /tmp/db.sql

	mysql -u root < /tmp/db.sql
fi

mysqld --bind-address=0.0.0.0