while read line  
do   
   export $line
done < ${0%/*}/../.env
docker exec $NAME_PROJECT_CONTAINER bash -c "composer create-project laravel/laravel $FOLDER_PROJECT $@"
docker exec $NAME_PROJECT_CONTAINER bash -c "mv $FOLDER_PROJECT/.env $FOLDER_PROJECT/.env.old"
${0%/*}/install/in_install.sh
docker exec $NAME_PROJECT_CONTAINER bash -c "cd $FOLDER_PROJECT && composer dump-autoload"
docker exec $NAME_PROJECT_CONTAINER bash -c "chmod 777 -R $FOLDER_PROJECT"
