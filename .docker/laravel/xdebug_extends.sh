#!/bin/bash

PATH_FOLDER=( /usr/local/lib/php/extensions/no-debug-non-zts-* )
NAME_FOLDER="${PATH_FOLDER/"/usr/local/lib/php/extensions/"/""}"

echo "" >> /usr/local/etc/php/conf.d/xdebug_extends.ini
echo "[xdebug_extends]" >> /usr/local/etc/php/conf.d/xdebug_extends.ini
echo "zend_extension = /usr/local/lib/php/extensions/$NAME_FOLDER/xdebug.so" >> /usr/local/etc/php/conf.d/xdebug_extends.ini
