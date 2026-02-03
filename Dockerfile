FROM php:8.2-fpm

# Installation de Git et extensions PHP de base
RUN apt-get update && apt-get install -y git && \
    docker-php-ext-install pdo_mysql && \
    rm -rf /var/lib/apt/lists/*

# Installation de Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Installation de Symfony CLI
RUN curl -sS https://get.symfony.com/cli/installer | bash && \
    mv /root/.symfony*/bin/symfony /usr/local/bin/symfony

WORKDIR /var/www

EXPOSE 9000
CMD ["php-fpm"]