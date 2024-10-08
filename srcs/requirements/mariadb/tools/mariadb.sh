#!/bin/bash

# if [ ! -d "/run/mysqld" ]; then
    # mkdir -p /run/mysqld
    # chown -R mysql:mysql /run/mysqld
# fi

# if [ -d "/var/lib/mysql/mysql" ]; then
    # rm -rf /var/lib/mysql
    mkdir -p /run/mysqld 
    chown -R mysql:mysql /var/lib/mysql /run/mysqld
    chmod 1777 /run/mysqld

    #start the database
    mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null
    TMP=/var/lib/mysql/tmpfile

    cat << EOF > ${TMP}
USE mysql;
FLUSH PRIVILEGES;
DELETE FROM mysql.user WHERE User='';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PW}';
CREATE DATABASE ${WP_DB_NAME};
CREATE USER '${WP_DB_USR}'@'%' IDENTIFIED BY '${WP_DB_PW}';
GRANT ALL PRIVILEGES ON ${WP_DB_NAME}.* TO '${WP_DB_USR}'@'%' IDENTIFIED BY '${WP_DB_PW}';
FLUSH PRIVILEGES;
EOF
        /usr/bin/mysqld --user=mysql --bootstrap < ${TMP}

sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

exec /usr/bin/mysqld --user=mysql --console
