FROM debian:bookworm

EXPOSE 3306

ARG DB_NAME=${DB_NAME}
ARG DB_USER=${DB_USER}
ARG DB_PASSWORD=${DB_PASSWORD}
ARG DB_ROOT_PASSWORD=${DB_ROOT_PASSWORD}

RUN apt update
RUN apt install -y mariadb-server

CMD ["mysqld_safe"]
