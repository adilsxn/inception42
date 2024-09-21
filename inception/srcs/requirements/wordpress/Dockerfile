FROM debian:bullseye

RUN apt -y update && apt install -y \
bash \
wget \
php  \
php-cgi \
php-pdo \
php-mysqli \
curl \
php-fpm 

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/. 

RUN mkdir /run/php

COPY ./tools/script.sh /usr/local/bin/

RUN chmod+x /usr/local/bin/script.sh

ENTRYPOINT ["/usr/local/bin/script.sh"]

WORKDIR /var/www/html/

EXPOSE 9000
CMD ["/usr/sbin/php-fpm7.4", "-F"]
