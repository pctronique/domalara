#!/bin/bash
if ! ${0%/*}/message_create_container.sh ; then
   exit 1
fi

while read line  
do   
   export $line
done < ${0%/*}/../../.env

if ! ${0%/*}/install/php_create_config.sh ; then
  exit 1
fi

#cd ${0%/*}/../
#if ! docker compose up -d ; then
#  exit 1
#fi

if ! ${0%/*}/project_bash.sh "composer create-project laravel/laravel $FOLDER_PROJECT $@" ; then
    exit 1
fi
if ! ${0%/*}/project_bash.sh "mv $FOLDER_PROJECT/.env $FOLDER_PROJECT/.env.old" ; then
    exit 1
fi
if ! ${0%/*}/install/in_install.sh ; then
  exit 1
fi
if ! ${0%/*}/project_bash.sh "cd $FOLDER_PROJECT && composer dump-autoload" ; then
    exit 1
fi
if ! ${0%/*}/project_bash.sh "chmod 777 -R $FOLDER_PROJECT" ; then
    exit 1
fi

exit 0
