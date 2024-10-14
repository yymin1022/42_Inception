FROM debian:bookworm

EXPOSE 9000

RUN apt update
RUN apt install -y php-fpm php-mysql mariadb-client curl

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/config.sh /var/www/html/config.sh
RUN chmod +x /var/www/html/config.sh

RUN sh /var/www/html/config.sh

WORKDIR /var/www/html
CMD ["php-fpm7.4", "-F"]
