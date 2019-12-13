service mysql start
service phpmyadmin start
service nginx start
mysql -e "
create database wordpression;
create user depression@localhost identified by 'owowhatsthis';
grant all privileges on wordpression.* to depression@localhost;
flush privileges;"

