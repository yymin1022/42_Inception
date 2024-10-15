FROM debian:bookworm

EXPOSE 3306

RUN apt update
RUN apt install -y mariadb-server

RUN rm -rf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d

COPY ./tools/setup.sh /
RUN bash ./setup.sh
RUN rm -rf setup.sh

CMD ["mysqld_safe"]
