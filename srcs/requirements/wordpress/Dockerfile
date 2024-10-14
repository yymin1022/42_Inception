FROM debian:bookworm

EXPOSE 9000

RUN apt update
RUN apt install -y php7.3-fpm php7.3-mysql mariadb-client curl

ADD https://wordpress.org/latest.tar.gz /var/www/wordpress.tar.gz
RUN cd /var/www
RUN tar -xzvf wordpress.tar.gz
RUN rm -rf wordpress.tar.gz
RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp --silent
RUN chmod +x ./usr/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
RUN mkdir /run/php

COPY ./conf/config.sh /var/www/wordpress/config.sh
RUN chmod +x /var/www/wordpress/config.sh

CMD ["bash", "/var/www/wordpress/config.sh"]
