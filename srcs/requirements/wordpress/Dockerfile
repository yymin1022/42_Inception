FROM debian:bookworm

EXPOSE 9000

RUN apt update
RUN apt install -y ca-certificates gnupg2 curl
RUN curl -fsSL https://packages.sury.org/php/apt.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/sury-php.gpg
RUN echo "deb https://packages.sury.org/php/ bookworm main" | tee /etc/apt/sources.list.d/php.list

RUN apt update
RUN apt install -y php7.4-fpm php7.4-mysql mariadb-client

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/config.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/config.sh
ENTRYPOINT ["/usr/local/bin/config.sh"]

WORKDIR /var/www/html
CMD ["/usr/sbin/php-fpm7.4", "-F"]
