FROM debian:buster


RUN apt update;apt install -y nginx openssl

RUN mkdir /etc/nginx/certs

RUN mkdir -p /etc/ssl/certs && \
	openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 \
	-subj "/C=US/ST=State/L=City/O=Organization/CN=localhost" \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt && \
	openssl dhparam -out /etc/nginx/dhparam.pem 2048

COPY nginx.conf /etc/nginx/nginx.conf
COPY sites-enabled /etc/nginx/sites-enabled

CMD nginx -g 'daemon off;'

EXPOSE 443