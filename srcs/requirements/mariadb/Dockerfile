FROM debian:bullseye

EXPOSE 3306

RUN apt update
RUN apt install -y mariadb-server

RUN rm -rf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d

COPY ./tools/setup.sh /tmp
RUN chmod +x /tmp/setup.sh
CMD ["sh", "/tmp/setup.sh"]
