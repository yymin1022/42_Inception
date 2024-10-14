FROM debian:bookworm

RUN apt update
RUN apt install -y nginx openssl

COPY ./conf/nginx.conf /etc/nginx/sites-available/default

RUN openssl req -x509 -days 365 -nodes -newkey rsa:4096 \
	-keyout /etc/ssl/private/nginx.key \
	-out /etc/ssl/certs/nginx.crt -sha256 -subj "/CN=yonyoo.42.fr"

CMD ["nginx", "-g", "daemon off;"]
