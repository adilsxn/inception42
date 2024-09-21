FROM debian:bullseye

RUN apt -y update && apt -y upgrade && \
apt install -y openssl \
apt install -y nginx && \
mkdir -p /var/www/html

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes \
        -out /etc/nginx/ssl/acuva-nu.crt \
        -keyout /etc/nginx/ssl/acuva-nu.key \
        -subj "/C=PT/ST=Lisbon/L=Lisbon/O=42School/OU=42Lisboa/CN=acuva-nu.42.fr" 

COPY ./conf/nginx.conf   /etc/nginx/conf.d

RUN mkdir -p /run/nginx
EXPOSE 443

CMD ["nginx","-g", "daemon off;"]
