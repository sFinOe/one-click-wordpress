# Makefile

.PHONY: all

all: .env
	cd srcs && docker-compose up --build

.env:
	echo "DOMAIN_NAME=zkasmi.42.fr" > srcs/.env
	echo "MYSQL_ROOT_PASSWORD=root" >> srcs/.env
	echo "MYSQL_DATABASE=wp" >> srcs/.env
	echo "MYSQL_USER=tnzoto" >> srcs/.env
	echo "MYSQL_PASSWORD=1234" >> srcs/.env
	echo "DB_HOST=mariadb" >> srcs/.env
