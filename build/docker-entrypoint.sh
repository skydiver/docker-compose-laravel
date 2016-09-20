#!/bin/bash

# CREATE LARAVEL APP IF NEEDED
if ! [ "$(ls -A /var/www/html/)" ]; then

    cd /tmp/
    composer create-project --prefer-dist laravel/laravel app
    mv /tmp/app/* /var/www/html/
    mv /tmp/app/.[!.]* /var/www/html/

    # UPDATE LARAVEL CONFIG
    sed -i -e 's/DB_HOST=127.0.0.1/DB_HOST=db/g' /var/www/html/.env
    sed -i -e 's/DB_DATABASE=homestead/DB_DATABASE=laravel/g' /var/www/html/.env
    sed -i -e 's/DB_USERNAME=homestead/DB_USERNAME=root/g' /var/www/html/.env
    sed -i -e 's/DB_PASSWORD=secret/DB_PASSWORD=root/g' /var/www/html/.env

fi

# APACHE CUSTOM USER
chown -R martin. /var/www/html

exec "$@"