FROM debian:bookworm

RUN apt update
RUN apt install -y nginx openssl

COPY ./conf/nginx.conf /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]
