#!/bin/bash

# APACHE CUSTOM USER
chown -R martin. /var/www/html

exec "$@"
