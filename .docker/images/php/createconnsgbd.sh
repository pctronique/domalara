#!/bin/bash

if [ -z ${PHP_FOLDER_PROJECT} ]
then
    PHP_FOLDER_PROJECT=/usr/local/apache2/www
fi

if [ -z ${PHP_FOLDER_INIT} ]
then
    PHP_FOLDER_INIT="/var/docker/php/"
fi

if [ -z ${PHP_NAME_PROJECT} ]
then
    PHP_NAME_PROJECT=project
fi

if [ -z ${PHP_SGBD_DATABASE} ]
then
    PHP_SGBD_DATABASE=project
fi

if [ -z ${PHP_SGBD_PASSWORD} ]
then
    PHP_SGBD_PASSWORD=secret
fi

if [ -z ${PHP_SGBD_USER} ]
then
    PHP_SGBD_USER=root
fi

if [ -z ${PHP_SGBD_HOST} ]
then
    PHP_SGBD_HOST=localhost
fi

if [ -z ${PHP_SGBD_TYPE} ]
then
    PHP_SGBD_TYPE=mysql
fi

if [ -z ${PHP_MAIL_MAILER} ]
then
    PHP_MAIL_MAILER=smtp
fi

if [ -z ${PHP_MAIL_HOST} ]
then
    PHP_MAIL_HOST=mailhog
fi

if [ -z ${PHP_MAIL_PORT} ]
then
    PHP_MAIL_PORT=1025
fi

if [ ! -f "${PHP_FOLDER_PROJECT}/.env.local.example" ]; then
    if [ -f "${PHP_FOLDER_PROJECT}/.env" ]; then
        cp ${PHP_FOLDER_PROJECT}/.env ${PHP_FOLDER_PROJECT}/.env.local.example
        sed -i "s/# DB_/DB_/" "${PHP_FOLDER_PROJECT}/.env.local.example"
        sed -i "s/^DB_CONNECTION=.*$/DB_CONNECTION=PHP_SGBD_TYPE/" "${PHP_FOLDER_PROJECT}/.env.local.example"
        sed -i "s/^DB_HOST=.*$/DB_HOST=PHP_SGBD_HOST/" "${PHP_FOLDER_PROJECT}/.env.local.example"
        sed -i "s/^DB_DATABASE=.*$/DB_DATABASE=PHP_SGBD_DATABASE/" "${PHP_FOLDER_PROJECT}/.env.local.example"
        sed -i "s/^DB_USERNAME=.*$/DB_USERNAME=PHP_SGBD_USER/" "${PHP_FOLDER_PROJECT}/.env.local.example"
        sed -i "s/^DB_PASSWORD=.*$/DB_PASSWORD=PHP_SGBD_PASSWORD/" "${PHP_FOLDER_PROJECT}/.env.local.example"
        sed -i "s/^MAIL_MAILER=.*$/MAIL_MAILER=PHP_MAIL_MAILER/" "${PHP_FOLDER_PROJECT}/.env.local.example"
        sed -i "s/^MAIL_HOST=.*$/MAIL_HOST=PHP_MAIL_HOST/" "${PHP_FOLDER_PROJECT}/.env.local.example"
        sed -i "s/^MAIL_PORT=.*$/MAIL_PORT=PHP_MAIL_PORT/" "${PHP_FOLDER_PROJECT}/.env.local.example"
        sed -i "s/^APP_NAME=.*$/APP_NAME=PHP_NAME_PROJECT/" "${PHP_FOLDER_PROJECT}/.env.local.example"
    fi

    if [ ! -f "${PHP_FOLDER_PROJECT}/.env.local.example" ]; then
        cp ${PHP_FOLDER_INIT}/.env.local.example ${PHP_FOLDER_PROJECT}/.env.local.example
    fi

    if [ -f "${PHP_FOLDER_PROJECT}/.env.local.example" ]; then
        cp ${PHP_FOLDER_PROJECT}/.env.local.example ${PHP_FOLDER_PROJECT}/.env
        sed -i "s/PHP_SGBD_TYPE/${PHP_SGBD_TYPE}/" "${PHP_FOLDER_PROJECT}/.env"
        sed -i "s/PHP_SGBD_HOST/${PHP_SGBD_HOST}/" "${PHP_FOLDER_PROJECT}/.env"
        sed -i "s/PHP_SGBD_DATABASE/${PHP_SGBD_DATABASE}/" "${PHP_FOLDER_PROJECT}/.env"
        sed -i "s/PHP_SGBD_USER/${PHP_SGBD_USER}/" "${PHP_FOLDER_PROJECT}/.env"
        sed -i "s/PHP_SGBD_PASSWORD/${PHP_SGBD_PASSWORD}/" "${PHP_FOLDER_PROJECT}/.env"
        sed -i "s/PHP_MAIL_MAILER/${PHP_MAIL_MAILER}/" "${PHP_FOLDER_PROJECT}/.env"
        sed -i "s/PHP_MAIL_HOST/${PHP_MAIL_HOST}/" "${PHP_FOLDER_PROJECT}/.env"
        sed -i "s/PHP_MAIL_PORT/${PHP_MAIL_PORT}/" "${PHP_FOLDER_PROJECT}/.env"
        sed -i "s/PHP_NAME_PROJECT/${PHP_NAME_PROJECT}/" "${PHP_FOLDER_PROJECT}/.env"
    fi
fi