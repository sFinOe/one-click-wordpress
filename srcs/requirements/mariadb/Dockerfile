FROM debian:buster

#Install necessary package
RUN apt-get update && apt-get -y install mariadb-server sudo \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir -p /var/run/mysqld \
	&& chown -R mysql:mysql /var/run/mysqld \
	&& chmod 777 /var/run/mysqld

EXPOSE 3306

COPY tools/configure.sh /tmp/configure.sh
RUN chmod +x /tmp/configure.sh

ENTRYPOINT ["/tmp/configure.sh"]