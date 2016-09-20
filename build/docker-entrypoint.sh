#!/bin/bash

# CREATE LARAVEL APP IF NEEDED
if ! [ "$(ls -A /var/www/html/)" ]; then
    cd /tmp/
    composer create-project --prefer-dist laravel/laravel app
    mv /tmp/app/* /var/www/html/
    mv /tmp/app/.[!.]* /var/www/html/
fi

# APACHE CUSTOM USER
chown -R martin. /var/www/html

exec "$@"