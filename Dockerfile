FROM php:5.4.44-apache

RUN apt-get update && apt-get dist-upgrade -qq -y
RUN apt-get install -y software-properties-common
RUN apt-get install -qq -y libmcrypt-dev mcrypt
RUN apt-get install -qq -y libpng12-dev
RUN apt-get install -qq -y libxml2-dev
RUN apt-get install -qq -y libldap2-dev
RUN apt-get install -qq -y libmemcached-dev zlib1g-dev libncurses5-dev

RUN a2enmod headers
RUN a2enmod expires
RUN a2enmod rewrite
RUN docker-php-ext-install mcrypt
RUN docker-php-ext-install gd
RUN docker-php-ext-install mysql
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install soap
RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu
RUN docker-php-ext-install ldap

RUN curl -L https://pecl.php.net/get/xdebug-2.3.3.tgz >> /usr/src/php/ext/xdebug.tgz && \
tar -xf /usr/src/php/ext/xdebug.tgz -C /usr/src/php/ext/ && \
rm /usr/src/php/ext/xdebug.tgz && \
docker-php-ext-install xdebug-2.3.3

RUN curl -L https://pecl.php.net/get/apcu-4.0.7.tgz >> /usr/src/php/ext/apcu.tgz && \
tar -xf /usr/src/php/ext/apcu.tgz -C /usr/src/php/ext/ && \
rm /usr/src/php/ext/apcu.tgz && \
docker-php-ext-install apcu-4.0.7

RUN curl -L http://pecl.php.net/get/memcached-2.2.0.tgz >> /usr/src/php/ext/memcached.tgz && \
tar -xf /usr/src/php/ext/memcached.tgz -C /usr/src/php/ext/ && \
rm /usr/src/php/ext/memcached.tgz && \
docker-php-ext-install memcached-2.2.0

COPY processmaker.conf /etc/apache2/sites-available/processmaker.conf
COPY config/php.ini /usr/local/etc/php/

RUN a2dissite processmaker.conf
RUN a2ensite processmaker.conf
