#!/bin/bash

WP_PATH=/var/www/html/wordpress

#check if wp-config file exists
if [-f ${WP_PATH}/wp-config.php]
then
     echo "Wordpress already exists"
else
    wget http://wordpress.org/latest.tar.gz
    tar xfz latest.tar.gz
    mv wordpress/* .
    rm -rf latest.tar.gz
    rm -rf wordpress
#Getting env vars 
    sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
    sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
    sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
    sed -i "s/db_name_here/$MYSQL_HOSTNAME/g" wp-config-sample.php
    cp wp-config-sample.php wp-config.php

echo "Starting wordpress on port 9000"
exec /usr/sbin/php-fpm7.4 -F -R

