FROM debian:buster
RUN apt update -y
RUN apt upgrade -y
RUN apt-get -y install wget

RUN apt-get install -y php7.3\
						php-fpm\
						php-mysql\
						mariadb-client
RUN sed -i 's/^listen = .*/listen = 9000/' /etc/php/7.3/fpm/pool.d/www.conf
RUN sed -i '/^;clear_env = no/c\clear_env = no' /etc/php/7.3/fpm/pool.d/www.conf

RUN wget https://fr-be.wordpress.org/wordpress-6.4.3-fr_BE.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.4.3-fr_BE.tar.gz && rm wordpress-6.4.3-fr_BE.tar.gz
RUN	chown -R root:root /var/www/wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY conf/auto_config.sh /usr/local/bin/auto_config.sh
RUN chmod +x /usr/local/bin/auto_config.sh
ENTRYPOINT ["/usr/local/bin/auto_config.sh"]
CMD ["/usr/sbin/php-fpm7.3", "-F"]


