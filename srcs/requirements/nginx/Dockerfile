FROM debian:buster


RUN apt update;apt install -y nginx openssl

RUN mkdir /etc/nginx/certs

# req -new : generate a new certificate request
# -nodes : generate key with no passphrase (password)
# -x509 generate a self-signed ssl  certificate
#CSR stands for Certificate Signing Request.

RUN mkdir -p /etc/ssl/certs && \
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-subj "/C=US/ST=State/L=City/O=Organization/CN=localhost" \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt

COPY nginx.conf /etc/nginx/nginx.conf
COPY sites-enabled /etc/nginx/sites-enabled

CMD ["nginx", "-g", "daemon off;"]

# using daemon off; allows nginx to run in the foreground and not as a daemon because containers exit when the process running in the foreground exits.