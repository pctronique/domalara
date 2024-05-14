#!/bin/bash

if [ -z ${PHP_FOLDER_PROJECT} ]
then
    PHP_FOLDER_PROJECT=/usr/local/apache2/www/
fi

if [ -z ${PHP_FOLDER_LOG} ]
then
    PHP_FOLDER_LOG=/var/log/docker/php/
fi

cd ${PHP_FOLDER_PROJECT}
php artisan serve --host 0.0.0.0 >> ${PHP_FOLDER_LOG}/laravel_out.log 2>> ${PHP_FOLDER_LOG}/laravel_error.log & 
