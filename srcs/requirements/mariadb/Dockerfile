FROM debian:buster
RUN apt update -y
RUN apt upgrade -y
RUN apt-get install mariadb-server -y
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/configure-mariadb.sh /usr/local/bin/configure-mariadb.sh
RUN chmod +x /usr/local/bin/configure-mariadb.sh
CMD ["/usr/local/bin/configure-mariadb.sh"]