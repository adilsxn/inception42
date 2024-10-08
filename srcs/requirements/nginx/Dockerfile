FROM alpine:3.19 

RUN apk update && apk upgrade && apk add --no-cache \
    openssl nginx 

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
            -out /etc/nginx/ssl/nginx-selfsigned.pem \
            -keyout /etc/nginx/ssl/nginx-selfsigned.key \
            -subj "/C=PT/ST=Lisboa/L=Lisboa/O=42School/OU=42Lisboa/CN=acuva-nu" 

RUN mkdir -p /run/nginx

COPY conf/nginx.conf   /etc/nginx/http.d/default.conf

ENTRYPOINT ["nginx","-g", "daemon off;"]
