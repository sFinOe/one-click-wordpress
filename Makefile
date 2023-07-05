# Makefile

HOME = /home/zkasmi


all:
	@mkdir -p $(HOME)/data/wordpress
	@mkdir -p $(HOME)/data/mariadb
	@docker-compose -f ./srcs/docker-compose.yml up

build:
	@mkdir -p $(HOME)/data/wordpress
	@mkdir -p $(HOME)/data/mariadb
	@docker-compose -f ./srcs/docker-compose.yml up --build

down :
	@docker-compose -f ./srcs/docker-compose.yml down

clean :
	@docker-compose -f ./srcs/docker-compose.yml down -v
	@docker system prune -f

fclean : clean
	@docker rmi -f $(docker images -q)

re : fclean all

.PHONY: all clean fclean re down