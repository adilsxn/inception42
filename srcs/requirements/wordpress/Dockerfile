FROM alpine:3.19 

#Install php and deps
RUN		apk update && apk upgrade &&\
		apk add --no-cache php81 php-phar php81-json php81-curl \
            php81-fpm php81-msqli php81-iconv mariadb-client curl \
            php81-cli curl bash vim


#Setting php-fpm to listesten to inception network port 9000
RUN  sed -i 's/listen = 127.0.0.1:9000/listen = 9000/g' /etc/php81/php-fpm.d/www.conf

#Installing wp-cli 
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp-cli.phar


WORKDIR /var/www/html/wordpress

COPY tools/wordpress.sh /tmp/wordpress.sh
RUN chmod +x /tmp/wordpress.sh

#Run the wp configuration script 
ENTRYPOINT ["sh", "/tmp/wordpress.sh"]


