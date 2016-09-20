FROM php:7-apache

# ENABLE MOD REWRITE
RUN a2enmod rewrite

# PHP EXTENSIONS
RUN apt-get update && apt-get install -y git-core libsqlite3-dev libpq-dev libmcrypt-dev libpng12-dev libjpeg-dev && rm -rf /var/lib/apt/lists/* \
        && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
        && docker-php-ext-install gd mysqli mcrypt zip mbstring pdo pdo_mysql pdo_sqlite pdo_pgsql json

# PHP OPCACHE
RUN { \
		echo 'opcache.memory_consumption=128'; \
		echo 'opcache.interned_strings_buffer=8'; \
		echo 'opcache.max_accelerated_files=4000'; \
		echo 'opcache.revalidate_freq=60'; \
		echo 'opcache.fast_shutdown=1'; \
		echo 'opcache.enable_cli=1'; \
	} > /usr/local/etc/php/conf.d/opcache-recommended.ini

# APACHE CUSTOM USER
RUN useradd -ms /bin/bash martin \
    && sed -i -e 's/www-data/martin/g' /etc/apache2/envvars \
    && sed -i -e 's/www-data/martin/g' /etc/apache2/apache2.conf \
    && sed -i -e 's/html/html\/public/g' /etc/apache2/sites-enabled/000-default.conf

VOLUME /var/www/html

# INSTALL COMPOSER + PACKAGES
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && composer global require "hirak/prestissimo:^0.3"

# APACHE WITH CUSTOM USER
RUN chown -R martin:martin /var/www/html/ -R

# DOCKER
COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]