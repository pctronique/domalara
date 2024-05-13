#!/bin/bash

if [ -z ${PHP_FOLDER_INIT} ]
then
    PHP_FOLDER_INIT="/var/docker/php/"
fi

if [ -z ${PHP_FOLDER_PROJECT} ]
then
    PHP_FOLDER_PROJECT=/usr/local/apache2/www
fi

if [ -z ${PHP_FOLDER_LOG} ]
then
    PHP_FOLDER_LOG=/var/log/docker/php/
fi

cd ${PHP_FOLDER_PROJECT}

if [ -z "$(ls -A ${PHP_FOLDER_PROJECT})" ]; then
    composer create-project laravel/laravel ./
    if [ -e ${PHP_FOLDER_INIT}/packages_install.list ]
    then
        while read line  
        do   
            if [ ! -z "$line" ]
            then
                composer require $line 2&>> ${PHP_FOLDER_LOG}create.log
            fi
        done < ${PHP_FOLDER_INIT}/packages_install.list
    fi

    #${PHP_FOLDER_INIT}/createconnsgbd.sh 2>> ${PHP_FOLDER_LOG}/createconnsgbd.log

    #php artisan migrate 2>> ${PHP_FOLDER_LOG}/createconnsgbd.log
fi

${PHP_FOLDER_INIT}/createconnsgbd.sh 2>> ${PHP_FOLDER_LOG}/createconnsgbd.log

composer install

touch ${PHP_FOLDER_LOG}/error.log
touch ${PHP_FOLDER_LOG}/symfony_out.log
touch ${PHP_FOLDER_LOG}/symfony_error.log

service startserver start && tail -F ${PHP_FOLDER_LOG}/error.log &
