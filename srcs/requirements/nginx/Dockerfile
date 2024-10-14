FROM debian:bookworm

RUN apt update
RUN apt install -y nginx openssl

CMD ["nginx", "-g", "daemon off;"]
