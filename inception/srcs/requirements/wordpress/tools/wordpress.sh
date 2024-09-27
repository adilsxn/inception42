#!/bin/bash


while ! mariadb -h${DB_HOST} -u${WP_DB_USR} -p${WP_DB_PW} ${WP_DB_NAME} &>/dev/null; do
    sleep 3
done

WP_PATH=/var/www/html/wordpress

if [ ! -f ${WP_PATH}/wp-config.php]; then
    wp-cli.phar cli update --yes --allow root
    wp-cli.phar core download --allow-root
    wp-cli.phar config create --dbname=${WP_DB_NAME} --dbuser=${WP_DB_PW} --dbhost=${DB_HOST} --path=${WP_PATH} --allow-root
    wp-cli.phar core install --url=${NGINX_HOST}/wordpress --title=${WP_TITLE} --admin-user=${WP_ADMIN_USR} --admin-password=${WP_ADMIN_PW} --admin-email=${WP_ADMIN_EMAIL} --path${WP_PATH} --allow-root
    wp-cli.phar user create ${WP_USR} ${WP_USR_EMAIL} --user_pass=${WP_USR_PW} --role=subscriber --display_name=${WP_USR} --porcelain --path=${WP_PATH} --allow-root
    wp-cli.phar theme install inspiro --path=${WP_PATH} --allow-root
    wp-cli.phar theme status inspiro --allow-root
fi

exec /usr/sbin/php-fpm81 -F -R
