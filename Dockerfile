FROM php:7.3.2-apache-stretch

# https://getcomposer.org/doc/03-cli.md#composer-allow-superuser
ENV COMPOSER_ALLOW_SUPERUSER 1

# Install openssl, git and unzip
RUN apt-get update && apt-get install -y \
    openssl \
    git \
    unzip \
 # Install Composer
 && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
 && composer --version \
 # Apache
 && a2enmod rewrite \
 && service apache2 restart \
 # Clone jikan-rest
 && git clone https://github.com/jikan-me/jikan-rest.git . \
 && composer install --prefer-dist --no-progress --no-suggest --classmap-authoritative  --no-interaction

#ADD .env /run-jikan.sh ./

# ENTRYPOINT ["docker-php-entrypoint"]
ENTRYPOINT ["./run-jikan.sh"]