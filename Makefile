COMPOSE_FILE = ./srcs/docker-compose.yml
IMAGES = nginx mariadb wordpress
VOLUMES = mariadb-volume wordpress-volume
DATA = /home/yonyoo/data

all:
	mkdir -p /home/yonyoo/data/wp
	mkdir -p /home/yonyoo/data/db
	sudo docker compose -f $(COMPOSE_FILE) up --build -d

clean:
	sudo docker compose -f $(COMPOSE_FILE) down

fclean: clean
	sudo docker image rm -f $(IMAGES)
	sudo docker volume rm -f $(VOLUMES)
	sudo rm -rf $(DATA)

re: fclean all

.PHONY : all clean fclean re
