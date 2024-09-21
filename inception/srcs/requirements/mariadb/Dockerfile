FROM debian:bullseye

#Install   mariadb
RUN apt -y update && apt install -y mariadb-server \
    mariadb-client


#Copy mariadb configuration script 
COPY ./tools/mariadb.sh /tmp/mariadb.sh
#Making the script executable
RUN chmod +x /tmp/mariadb.sh

#Setting the script as the entrypoint
ENTRYPOINT ["sh", "/tmp/mariadb.sh"]


