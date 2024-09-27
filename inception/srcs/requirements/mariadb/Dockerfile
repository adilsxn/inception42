FROM alpine:3.19

#Install   mariadb
RUN apk update && apk upgrade && apk add --no-cache\
    mariadb mariadb-client


#Copy mariadb configuration script 
COPY tools/mariadb.sh /tmp/mariadb.sh

#Making the script executable
RUN chmod +x /tmp/mariadb.sh

#Setting the script as the entrypoint
ENTRYPOINT ["sh", "/tmp/mariadb.sh"]


