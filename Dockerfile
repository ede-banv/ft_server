
#dockerfile docs https://docs.docker.com/engine/reference/builder/#entrypoint

#image de depart Debian buster https://git.ethitter.com/docker/images/blob/6bcacb14d90096bfb9d229049122fe5f07ce8daa/debian/buster/Dockerfile
FROM debian:buster
#je cree mon fichier dans mon build
WORKDIR /tmp/
#maintenant il faut connecter un shel???



#puis installer nginx (avec des RUN????????)
RUN apt update -y &&\
 apt upgrade -y &&\
 apt install nginx -y &&\
 apt-get install -y gnupg2 wget apt-utils
#remplacer le fichier de config existant avec un fichier cree avec mes configs (ssl)




#telecharger mySQL (creer un utilisateur a qui on donne ts les privileges (root))
#https://unix.stackexchange.com/questions/536538/how-can-i-install-mysql-on-debian-10-buster
#here i use from https://tecadmin.net/install-mysql-server-on-debian9-stretch/ (but options to choose from)
COPY srcs/sqlkey.pub /tmp/
RUN apt-key add /tmp/sqlkey.pub \
&& echo "deb http://repo.mysql.com/apt/debian/ buster mysql-5.7" | tee /etc/apt/sources.list.d/docker.list \
&& apt-get update \
&& debconf-set-selections << "mysql-community-server mysql-community-server/root-pass password password" \
&& debconf-set-selections << "mysql-community-server mysql-community-server/re-root-pass password password" \
&& export DEBIAN_FRONTEND=noninteractive && apt-get -y install mysql-server

#creer une base de donnees pour wordpress


#il faut utiliser ADD pour installer Wrodpress depuis sources
#installer wordpress https://kifarunix.com/install-wordpress-5-with-nginx-on-debian-10-buster/
#??? https://www.openssl.org/source/




#config nginx avec php (phpmyadmin) pour que le serveur puisse interpreter du php (le transformer en html)
#https://kifarunix.com/install-phpmyadmin-with-nginx-on-debian-10-buster/
RUN apt install -y php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip \
&& wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-english.tar.gz \
&& mkdir /var/www/html/phpmyadmin \
&& tar xzf phpMyAdmin-4.9.0.1-english.tar.gz --strip-components=1 -C /var/www/html/phpmyadmin

#will strt commands that will create sql server https://kifarunix.com/install-wordpress-5-with-nginx-on-debian-10-buster/
COPY srcs/exec.sh /tmp/
ENTRYPOINT [ "/bin/sh", "/tmp/exec.sh"]
