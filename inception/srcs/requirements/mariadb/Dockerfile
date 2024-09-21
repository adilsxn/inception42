FROM debian:bullseye

RUN apt -y update && apt install -y mariadb-server \
    mariadb-client

RUN mkdir -p var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld 

EXPOSE 3306

COPY ./tools/script.sh ./usr/local/bin/
COPY ./conf/wordpress.sql ./usr/local/bin/
RUN chmod +x /usr/local/bin/wordpress.sh
RUN chmod +x /usr/local/bin/wordpress.sql

ENTRYPOINT ["/usr/local/bin/mariadb.sh"]
CMD ["mysqld", "--bind-address=0.0.0.0"]

