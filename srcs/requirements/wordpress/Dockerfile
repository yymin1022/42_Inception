FROM debian:bookworm

EXPOSE 9000

RUN apt update
RUN apt install -y lsb-release apt-transport-https ca-certificates wget gnupg2
RUN wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add -
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/sury-php.list

RUN apt update
RUN apt install -y php7.4-fpm php7.4-mysql mariadb-client curl

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d

ADD https://wordpress.org/latest.tar.gz /var/www/wordpress.tar.gz
RUN cd /var/www && tar -xzvf wordpress.tar.gz && rm -rf wordpress.tar.gz
RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp --silent
RUN chmod +x ./usr/bin/wp

COPY ./conf/config.sh /var/www/wordpress/config.sh
RUN chmod +x /var/www/wordpress/config.sh

CMD ["bash", "/var/www/wordpress/config.sh"]
