service mysql start
mysql -e "
create database wordpression;
create user depression@localhost identified by 'owowhatsthis';
grant all privileges on wordpression.* to depression@localhost;
flush privileges;"
service nginx start
service php7.3-fpm start
tail -f /dev/null