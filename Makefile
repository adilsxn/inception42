DATA=		/home/acuva-nu/data
COMPOSE_FILE=		./srcs/docker-compose.yml

RM=sudo rm -rf

all: up

up: setup
		docker-compose -f $(COMPOSE_FILE) up --build -d

down:
		docker-compose -f $(COMPOSE_FILE) down

start: 
		docker-compose -f $(COMPOSE_FILE) start


stop: 
		docker-compose -f $(COMPOSE_FILE) stop

setup:
	  @echo "Setting up the directories\n"
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
		@docker system prune -f -a --volumes
		@docker volume rm -f $(shell docker volume ls -q)

.PHONY: all up down start stop status logs clean fclean
