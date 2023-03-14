FROM debian:buster

RUN apt update;apt install -y php-fpm php-mysql wget

RUN cd /tmp/ \
	&& wget https://wordpress.org/latest.tar.gz \
	&& tar -xvf latest.tar.gz

COPY configure.sh /tmp/configure.sh

RUN chmod +x /tmp/configure.sh

RUN sed -i "s/\/run\/php\/php7.3-fpm.sock/0.0.0.0:9000/g" /etc/php/7.3/fpm/pool.d/www.conf && \
	mkdir -p /run/php

EXPOSE 9000

ENTRYPOINT /tmp/configure.sh
