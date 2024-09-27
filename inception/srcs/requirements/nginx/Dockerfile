FROM alpine:3.19 

RUN apk update && apk upgrade &&  apk add --no-cache \
    openssl nginx

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -newkey rsa:4096 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/acuva-nu.crt \
        -keyout /etc/nginx/ssl/acuva-nu.key \
        -subj "/C=PT/ST=Lisbon/L=Lisbon/O=42School/OU=42Lisboa/CN=acuva-nu.42.fr" 


RUN mkdir -p /run/nginx


COPY conf/nginx.conf   /etc/nginx/conf.d/default.conf

ENTRYPOINT ["nginx","-g", "daemon off;"]
