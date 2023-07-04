FROM debian:buster

RUN apt-get update && apt-get -y install wget php7.3 sendmail php-fpm php-mysqli

EXPOSE 9000

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

COPY ./tools /tmp

RUN chmod +x /tmp/configure.sh

# RUN sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";

RUN mkdir -p /var/www/html && \
	chown -R www-data:www-data /var/www/* && \
	chown -R 755 /var/www/* && \
	mkdir -p /run/php/ && \
	touch /run/php/php7.3-fpm.pid


RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

ENTRYPOINT [ "/tmp/configure.sh" ]

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]