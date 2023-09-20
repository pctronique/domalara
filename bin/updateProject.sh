while read line  
do   
   export $line
done < ${0%/*}/../.env
docker exec $NAME_LARAVEL_CONTAINER bash -c "cd $FOLDER_PROJECT_LARAVEL && composer install"
