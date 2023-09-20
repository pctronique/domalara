while read line  
do   
   export $line
done < ${0%/*}/../.env
docker exec -t $NAME_LARAVEL_CONTAINER php /opt/phpDocumentor/vendor/bin/phpdoc "$@"
