FROM php:8.2-fpm AS build

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y curl zip libzip-dev npm

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY . ./

RUN composer install && npm install && npm run build


FROM php:8.2-apache AS production

COPY apache.conf /etc/apache2/sites-enabled/000-default.conf

RUN mkdir -p /usr/local/etc/php
COPY ./php.ini /usr/local/etc/php/php.ini

# RUN apt-get update && apt-get install -y libmagickwand-dev --no-install-recommends

RUN apt-get update && apt-get install -y libzip-dev 


# RUN apt-get install php81-mbstring  -y
# RUN docker-php-ext-install -j$(nproc) mbstring  -y
RUN docker-php-ext-install -j$(nproc) iconv mysqli pdo_mysql zip


RUN apt-get install -y \
    default-mysql-client \
    libmcrypt-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pecl install mcrypt
RUN docker-php-ext-enable mcrypt

WORKDIR /var/www/html

COPY --from=build /var/www/html/ ./
# For no-build mode
# COPY ./resources/js/ ./public/js/

EXPOSE 80

RUN a2enmod rewrite
