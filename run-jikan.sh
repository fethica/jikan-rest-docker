#!/usr/bin/env bash
# allow write permission
chmod -R a+w storage/

# php:7.3.2-apache-stretch ENTRYPOINT
docker-php-entrypoint apache2-foreground