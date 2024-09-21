#!/bin/bash


/etc/init.d/mysql start

#Check if db exists

if [-d "/run/mysqld"]; 
    mkdir -p /run/mysqld
    chown -R mysql:mysql /run/mysqld
fi

if [-d "/run/mysqld"]
then
else
    chown -R mysql:mysql /var/lib/mysql 
    mysql_install_db --basedir=/usr --datadir=var/lib/mysql --user=mysql --rpm > /dev/null

fi

#Import database in the mysql command line
mysql -u root -p$MYSQL_ROOT_PW $MYSQL_DB < /usr/local/bin/wordpress.sql

fi

/etc/init.d/mysql stop

exec "$@"
