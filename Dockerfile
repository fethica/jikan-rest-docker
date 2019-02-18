FROM php:7.3.2-apache-stretch

# Install openssl, git and unzip
RUN apt-get update && apt-get install -y \
    openssl \
    git \
    unzip

# https://getcomposer.org/doc/03-cli.md#composer-allow-superuser
ENV COMPOSER_ALLOW_SUPERUSER 1

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
&& composer --version

## Apache
RUN a2enmod rewrite \
&& service apache2 restart

# Clone and setup jikan-rest
RUN git clone https://github.com/jikan-me/jikan-rest.git . \
&& mv .env.dist .env \
&& echo "\nREDIS_HOST=redis" >> .env \
&& echo "REDIS_PASSWORD=null" >> .env \
&& echo "REDIS_PORT=6379" >> .env \
&& composer install --prefer-dist --no-progress --no-suggest --classmap-authoritative  --no-interaction
