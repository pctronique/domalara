#!/bin/bash
if ! ${0%/*}/message_create_container.sh ; then
   exit 1
fi

while read line  
do   
   export $line
done < ${0%/*}/../../.env

if ! ${0%/*}/php_create_config.sh ; then
  exit 1
fi

if [ -e ${0%/*}/../../tmp_install/type_install ]
then
  while read line  
  do   
    export $line
  done < ${0%/*}/../../tmp_install/type_install
fi

if [ -z "$IS_CREATE_FOLDER" ]
then
  if ! ${0%/*}/project_bash.sh "composer create-project laravel/laravel $FOLDER_PROJECT $@" ; then
    exit 1
  else
    echo "IS_CREATE_FOLDER=false" >> "${0%/*}/../../tmp_install/type_install"
  fi
fi
if ! ${0%/*}/project_bash.sh "mv $FOLDER_PROJECT/.env $FOLDER_PROJECT/.env.old" ; then
    exit 1
fi
if ! ${0%/*}/in_install.sh ; then
  exit 1
fi

if [ -e ${0%/*}/packages_install.list ]
then
  while read line  
  do   
    if [ ! -z "$line" ]
    then
      if ! ${0%/*}/project_bash.sh "cd $FOLDER_PROJECT/ && composer require $line" ; then
        exit 1
      fi
    fi
  done < ${0%/*}/packages_install.list
fi

if ! ${0%/*}/project_bash.sh "cd $FOLDER_PROJECT && composer dump-autoload" ; then
    exit 1
fi
if ! ${0%/*}/project_bash.sh "chmod 777 -R $FOLDER_PROJECT" ; then
    exit 1
fi

exit 0
