FROM debian:bookworm

EXPOSE 9000

RUN apt update
RUN apt install -y php-fpm php-mysql mariadb-client curl

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d

ADD https://wordpress.org/latest.tar.gz /var/www/wordpress.tar.gz
RUN cd /var/www && tar -xzvf wordpress.tar.gz && rm -rf wordpress.tar.gz
RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp --silent
RUN chmod +x ./usr/bin/wp

COPY ./conf/config.sh /var/www/wordpress/config.sh
RUN chmod +x /var/www/wordpress/config.sh

CMD ["bash", "/var/www/wordpress/config.sh"]
