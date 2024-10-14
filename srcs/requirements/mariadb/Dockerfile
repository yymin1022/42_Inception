FROM debian:bookworm

EXPOSE 3306

ARG DB_NAME=${DB_NAME}
ARG DB_USER=${DB_USER}
ARG DB_PASSWORD=${DB_PASSWORD}
ARG DB_ROOT_PASSWORD=${DB_ROOT_PASSWORD}

RUN apt update
RUN apt install -y mariadb-server

RUN rm -rf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d

COPY conf/setup.sh /
RUN bash ./setup.sh
RUN rm -rf setup.sh

CMD ["mysqld_safe"]
