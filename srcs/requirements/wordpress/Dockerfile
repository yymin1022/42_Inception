FROM debian:bullseye

EXPOSE 9000

RUN apt update
RUN apt install -y php7.4-fpm php7.4-mysql mariadb-client curl

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir /run/php

COPY ./tools/config.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/config.sh
ENTRYPOINT ["/usr/local/bin/config.sh"]

WORKDIR /var/www/html
CMD ["/usr/sbin/php-fpm7.4", "-F"]
