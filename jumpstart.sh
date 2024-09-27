#!/bin/bash

sed -i "s/login/${LOGIN}/g" srcs/.env
sed -i "s/login/${LOGIN}/g" srcs/requirements/nginx/conf/nginx.conf

if ! grep -q ${DOMAIN} "/etc/hosts"; then
    echo "127.0.0.1" ${DOMAIN} | sudo tee -a /etc/hosts
fi
