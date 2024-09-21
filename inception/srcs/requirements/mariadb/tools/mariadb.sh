#!/bin/bash

mysql_install_db

/etc/init.d/mysql start

#Check if db exists

if [-d "/var/lib/mysql/$MYSQL_DB"]
then
    echo "Database is already here"
else
    mysql_secure_installation << _EOF_
    it-was-snowfall
    and-reagan-gave-me-the-vision
    _EOF

echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' 'MYSQL_ROOT_PW'; FLUSH PRIVILEGES;" | mysql -u root
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DB; GRANT ALL ON $MYSQL_DB.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PW'; FLUSH PRIVILEGES;" | mysql -u root

#Import database in the mysql command line
mysql -u root -p$MYSQL_ROOT_PW $MYSQL_DB < /usr/local/bin/wordpress.sql

fi

/etc/init.d/mysql stop

exec "$@"
