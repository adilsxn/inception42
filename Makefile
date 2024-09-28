LOGIN=login
DOMAIN = ${LOGIN}.42.fr
DATA=/home/${LOGIN}/data
COMPOSE_FILE=./srcs/docker-compose.yml
ENV= LOGIN=${LOGIN} DATA=${DATA} DOMAIN=${LOGIN}.42.fr

RM=sudo rm -rf

all: up

up: setup
		@${ENV} docker-compose -f $(COMPOSE_FILE) up --build -d

down:
		@${ENV} docker-compose -f $(COMPOSE_FILE) down

start: 
		@${ENV} docker-compose -f $(COMPOSE_FILE) start


stop: 
		@${ENV} docker-compose -f $(COMPOSE_FILE) stop

setup:
	  ${ENV} ./jumpstart.sh
	  @echo "Setting up the directories\n"
	  @sudo mkdir -p /home/${LOGIN}
	  @sudo mkdir -p ${DATA}
	  @sudo mkdir -p ${DATA}/mariadb-vol
	  @sudo mkdir -p ${DATA}/wordpress-vol

	  
status:
		@cd srcs && docker-compose ps && cd ..

logs:
		@cd srcs && docker-compose logs && cd ..
clean:
		${RM} ${DATA}

fclean: down clean
		${ENV} ./shutdown.sh
		@docker system prune -f -a --volumes
		@docker volume rm srcs_mariadb srcs_wordpress

.PHONY: all up down start stop status logs clean fclean
