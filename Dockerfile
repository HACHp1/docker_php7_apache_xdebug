FROM php:7.1.15-apache

MAINTAINER HACHp1 GmbH <hach.chp@gmail.com>

RUN sed -i "s/archive.ubuntu./mirrors.aliyun./g" /etc/apt/sources.list
RUN sed -i "s/deb.debian.org/mirrors.aliyun.com/g" /etc/apt/sources.list
RUN sed -i "s/security.debian.org/mirrors.aliyun.com\/debian-security/g" /etc/apt/sources.list
RUN apt-get -y update

RUN apt-get install -y apt-utils vim curl
RUN pecl install xdebug

# The base image does not have php.ini. 
ADD ./php.ini /usr/local/etc/php/

COPY ./index.php /var/www/html/

EXPOSE 80