# Makefile

.PHONY: all

all: .env
	cd srcs && docker-compose up --build

.env:
	echo "DOMAIN_NAME=zkasmi.42.fr" > srcs/.env
	echo "MYSQL_ROOT_PASSWORD=123456" >> srcs/.env
	echo "MYSQL_DATABASE=wp" >> srcs/.env
	echo "MYSQL_USER=tnzoto" >> srcs/.env
	echo "MYSQL_PASSWORD=1234" >> srcs/.env
	echo "WP_USER_NORMAL=miniBig" >> srcs/.env
	echo "WP_PASSWORD_NORMAL=123456" >> srcs/.env
	echo "DB_HOST=mariadb" >> srcs/.env
	echo "WP_URL=localhost" >> srcs/.env
	echo "WP_TITLE=My WordPress" >> srcs/.env
	echo "WP_USER=bigBro" >> srcs/.env
	echo "WP_PASSWORD=jyEcC@4dC@1" >> srcs/.env
	echo "WP_EMAIL=mail@mail.com" >> srcs/.env
