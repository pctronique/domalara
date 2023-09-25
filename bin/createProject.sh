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

#cd ${0%/*}/../
#if ! docker compose up -d ; then
#  exit 1
#fi

docker exec $NAME_PROJECT_CONTAINER bash -c "composer create-project laravel/laravel $FOLDER_PROJECT $@"
docker exec $NAME_PROJECT_CONTAINER bash -c "mv $FOLDER_PROJECT/.env $FOLDER_PROJECT/.env.old"
if ! ${0%/*}/install/in_install.sh ; then
  exit 1
fi
docker exec $NAME_PROJECT_CONTAINER bash -c "cd $FOLDER_PROJECT && composer dump-autoload"
docker exec $NAME_PROJECT_CONTAINER bash -c "chmod 777 -R $FOLDER_PROJECT"

exit 0
