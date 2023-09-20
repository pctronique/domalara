while read line  
do   
   export $line
done < ${0%/*}/../.env
docker exec $NAME_LARAVEL_CONTAINER bash -c "composer create-project laravel/laravel $FOLDER_PROJECT_LARAVEL $@"
docker exec $NAME_LARAVEL_CONTAINER bash -c "chmod 777 -R $FOLDER_PROJECT_LARAVEL"
