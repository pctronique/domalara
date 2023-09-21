#!/bin/bash

while read line  
do   
   export $line
done < ${0%/*}/../../.env

LINE1="- .\/.docker\/config\/.env:\/home\/project\/www\/.env:rw"
LINE1_REPLACE="- .\/.docker\/config\/.env:\/home\/project\/$FOLDER_PROJECT_LARAVEL\/.env:rw"
DESACTIVE="#"
FILE="${0%/*}/../../docker-compose.yml"

sed -i "s/$DESACTIVE$LINE1/$LINE1_REPLACE/" $FILE

cd ${0%/*}/../../
docker-compose up -d
