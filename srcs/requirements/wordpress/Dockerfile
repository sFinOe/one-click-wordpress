FROM debian:buster

RUN apt update;apt install -y php-fpm php-mysql wget

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY tools/configure.sh /tmp/configure.sh

RUN chmod +x /tmp/configure.sh

RUN sed -i "s/\/run\/php\/php7.3-fpm.sock/0.0.0.0:9000/g" /etc/php/7.3/fpm/pool.d/www.conf && \
	mkdir -p /run/php


ENTRYPOINT /tmp/configure.sh
