FROM alpine:3.19 

RUN apk update && apk upgrade &&  apk add --no-cache \
    openssl nginx && mkdir -p /var/www/html/

COPY conf/nginx.conf   /etc/nginx/conf.d/default.conf

RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096\
        -out /etc/nginx/ssl/acuva-nu.crt \
        -keyout /etc/nginx/ssl/acuva-nu.key \
        -subj "/C=PT/ST=Lisbon/L=Lisbon/O=42School/OU=42Lisboa/CN=acuva-nu.42.fr" 

RUN adduser -D -g 'www' www &&\
    chown -R www:www /run/nginx/ && \
    chown -R www:www /var/www/html/

EXPOSE 443/tcp

RUN mkdir -p /run/nginx

ENTRYPOINT ["nginx","-g", "daemon off;"]
