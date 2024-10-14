FROM debian:bookworm

EXPOSE 9000

RUN apt update
RUN apt install -y php-fpm php-mysql mariadb-client curl

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d
RUN mkdir /run/php

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/config.sh /tmp/config.sh
RUN chmod +x /tmp/config.sh

ENTRYPOINT ["bash", "/tmp/config.sh"]

WORKDIR /var/www/html
CMD ["/usr/sbin/php-fpm7.4", "-F"]
