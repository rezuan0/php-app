FROM php:7.4.33-fpm
WORKDIR /var/www/html

# Install dependencies and extensions
# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt-get update -y
RUN apt-get install -y unzip libpq-dev libcurl4-gnutls-dev
RUN docker-php-ext-install pdo pdo_mysql bcmath


COPY --from=composer:2.3.5 /usr/bin/composer /usr/bin/composer

COPY package.json composer.json   /var/www/html/
COPY vendor /var/www/html/

RUN composer update

ENV PORT=8000

# CMD [ "Docker/entrypoint.sh" ]


