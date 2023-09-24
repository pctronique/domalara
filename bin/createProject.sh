#!/bin/bash
if ! ${0%/*}/install/message_create_container.sh ; then
   exit 1
fi

while read line  
do   
   export $line
done < ${0%/*}/../.env

if ! ${0%/*}/install/php_create_config.sh ; then
  exit 1
fi

cd ${0%/*}/../
docker-compose up -d

docker exec $NAME_LARAVEL_CONTAINER bash -c "composer create-project laravel/laravel $FOLDER_PROJECT_LARAVEL $@"
docker exec $NAME_LARAVEL_CONTAINER bash -c "mv $FOLDER_PROJECT_LARAVEL/.env $FOLDER_PROJECT_LARAVEL/.env.old"
${0%/*}/install/in_install.sh
docker exec $NAME_LARAVEL_CONTAINER bash -c "cd $FOLDER_PROJECT_LARAVEL && composer dump-autoload"
docker exec $NAME_LARAVEL_CONTAINER bash -c "chmod 777 -R $FOLDER_PROJECT_LARAVEL"

exit 0
