#!/bin/bash

sed -i "s/login/${LOGIN}/g" src/.env
sed -i "s/login/${LOGIN}/g" src/requirements/nginx/conf/nginx.conf

if ! grep -g ${DOMAIN} "/etc/hosts"; then
    echo "127.0.0.1" ${DOMAIN} | sudo tee -a /etc/hosts
fi
