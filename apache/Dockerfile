FROM php:8.2-apache

RUN apt-get update && apt install wget curl -y
RUN apt-get install wget -y

RUN apt-get update && apt-get install -y libmagickwand-dev --no-install-recommends

RUN apt-get install default-mysql-client libfreetype6-dev libjpeg62-turbo-dev libpng-dev libjpeg-dev libzip-dev libmcrypt-dev -y && rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-install -j$(nproc) iconv mysqli pdo_mysql zip gd
RUN docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg

RUN pecl install mcrypt
RUN printf "\n" | pecl install imagick

RUN docker-php-ext-enable mcrypt imagick

RUN chown -R www-data:www-data /var/www

RUN a2enmod rewrite
