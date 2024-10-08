FROM alpine:3.19

RUN apk update && apk add --no-cache\
    mariadb\
    mariadb-client \
    bash

COPY tools/mariadb.sh /tmp/mariadb.sh

ENTRYPOINT ["sh", "/tmp/mariadb.sh"]


