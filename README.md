# Docker + Laravel

## Description
Laravel / Docker dev container

## Software
* Apache
* PHP 7.1
* MariaDB
* MailHog

## Usage
1. clone repo
2. Edit ```build/Dockerfile``` and replace the following line with your username:
```
RUN chown -R martin:martin /var/www/html/ -R
```
3. Edit ```build/docker-entrypoint.sh``` and replace the following line with your username:
```
chown -R martin. /var/www/html
```
4. ```docker-compose up```
