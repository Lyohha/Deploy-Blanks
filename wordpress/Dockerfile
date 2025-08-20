FROM wordpress:6.8.2-php8.2-apache

# Копируем содержимое wp-content
COPY ./wp-content /var/www/html/wp-content
COPY ./wp-config /var/www/html/wp-config
RUN chown -R www-data:www-data /var/www/html/wp-content

RUN ln -sf /var/www/html/wp-config/.htaccess /var/www/html/.htaccess

