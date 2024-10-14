all:
	sudo docker compose -f ./srcs/docker-compose.yml up -d

clean:
	sudo docker compose -f ./srcs/docker-compose.yml down --rmi all

fclean: clean

re: fclean all

.PHONE: all, clean, fclean, re
