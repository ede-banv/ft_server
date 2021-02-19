

FROM debian:buster

WORKDIR /tmp/

#################
# Nginx install #
#################
RUN apt update -y &&\
 apt upgrade -y &&\
 apt install nginx -y &&\
 apt-get install -y gnupg2 wget apt-utils


#################
# MySQL install #
#################
COPY srcs/sqlkey.pub /tmp/
RUN apt install -y mariadb-server


######################
# Phpmyadmin install #
######################
RUN apt install -y php php-fpm php-mysqli php-pear php-mbstring	php-gettext php-common php-phpseclib php-mysql \
&& wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-english.tar.gz \
&& mkdir /var/www/html/phpmyadmin \
&& tar xzf phpMyAdmin-4.9.0.1-english.tar.gz --strip-components=1 -C /var/www/html/phpmyadmin


###############################
# Worpress install and config #
###############################
COPY srcs/config /etc/nginx/sites-available
RUN ln -s /etc/nginx/sites-available/config /etc/nginx/sites-enabled \
&& rm -f /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default \
&& wget https://wordpress.org/latest.tar.gz -P /tmp \
&& mkdir /var/www/html/wordpression \
&& tar xzf /tmp/latest.tar.gz --strip-components=1 -C /var/www/html/wordpression
COPY srcs/wp-config.php /var/www/html/wordpression
RUN chown -R www-data:www-data /var/www/html/wordpression


##############
# SSL config #
##############
COPY srcs/domain.key /tmp/
COPY srcs/domain.crt /tmp/


###################
# Docker run info #
###################
COPY srcs/exec.sh /tmp
ENTRYPOINT [ "/bin/sh", "/tmp/exec.sh" ]