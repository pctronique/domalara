while read line  
do   
   export $line
done < ${0%/*}/../.env
docker exec $NAME_LARAVEL_CONTAINER bash -c "composer create-project laravel/laravel $FOLDER_PROJECT_LARAVEL $@"
docker exec $NAME_LARAVEL_CONTAINER bash -c "mv $FOLDER_PROJECT_LARAVEL/.env $FOLDER_PROJECT_LARAVEL/.env.old"
${0%/*}/install/in_install.sh
docker exec $NAME_LARAVEL_CONTAINER bash -c "cd $FOLDER_PROJECT_LARAVEL && composer dump-autoload"
docker exec $NAME_LARAVEL_CONTAINER bash -c "chmod 777 -R $FOLDER_PROJECT_LARAVEL"
