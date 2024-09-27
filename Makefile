LOGIN=login
DOMAIN = ${LOGIN}.42.fr
DATA=/home/login/data
COMPOSE_FILE=./srcs/docker-compose.yml
ENV= LOGIN=${LOGIN} DATA=${DATA} DOMAIN=${LOGIN}.42.fr

RM=rm -rf

all: up

up: setup
		@docker-compose -f $(COMPOSE_FILE) up --build -d

down:
		@docker-compose -f $(COMPOSE_FILE) down

start: 
		@docker-compose -f $(COMPOSE_FILE) start


stop: 
		@docker-compose -f $(COMPOSE_FILE) stop

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
