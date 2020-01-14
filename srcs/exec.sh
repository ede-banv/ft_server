service mysql start
mysql -e "
create database wordpression;
create user depression@localhost identified by 'owowhatsthis';
grant all privileges on wordpression.* to depression@localhost;
flush privileges;"
service phpmyadmin start
service nginx start
