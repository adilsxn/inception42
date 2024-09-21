FROM debian:bullseye

#Install php and deps
RUN apt -y update && apt install -y \
    bash \
    wget \
    php  \
    php-cgi \
    php-pdo \
    php-mysqli \
    curl \
    php-fpm 

#Setting php-fpm to listesten to inception network port 9000
RUN  sed -i 's/listen = 127.0.0.1:9000/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

#Installing wp-cli 
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp-cli.phar


COPY ./tools/wordpress.sh /tmp/wordpress.sh

RUN chmod +x /tmp/wordpress.sh


WORKDIR /var/www/html/wordpress

#Run the wp configuration script 
ENTRYPOINT ["sh", "/tmp/wordpress.sh"]


