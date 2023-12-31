#!/bin/bash
case "$1" in
  --del-port)
    rm -f -r "${0%/*}/.env"
    ;;
   
  --help)
    echo "$ .install.sh"
    echo "Ou"
    echo "$ .install.sh [option]"
    echo "Options:"
    echo "   --del-port : Pour modifier le numéros des ports."
    echo "   --helps    : Pour afficher l'aide."
    exit 0
    ;;

esac

if [ ! -e ${0%/*}/.env ]
then
  if ! ${0%/*}/bin/install/create_env_exp.sh ; then
    exit 1
  fi
fi

if [ -e ${0%/*}/tmp_install/type_install ]
then
  while read line  
  do   
    export $line
  done < ${0%/*}/tmp_install/type_install
else
  TYPE_INSTALL_PROJECT="update"
fi

# creation des tmp du docker
mkdir -p projecttmp/sgbd_data
mkdir -p projecttmp/tmp
mkdir -p projecttmp/tmp/php
mkdir -p projecttmp/tmp/sgbd
mkdir -p projecttmp/logs
mkdir -p projecttmp/logs/laravel
mkdir -p projecttmp/logs/php
mkdir -p projecttmp/logs/xdebug
mkdir -p projecttmp/logs/sgbd
mkdir -p projecttmp/logs/httpd

touch projecttmp/logs/laravel/laravel_out.log
touch projecttmp/logs/laravel/laravel_error.log

# modifier les droits sur les dossiers
rm -f -r "/tmp/error_chmod_docker.log"
chmod 777 -R ${0%/*}/project 2> /tmp/error_chmod_docker.log
chmod 777 -R ${0%/*}/projecttmp 2> /tmp/error_chmod_docker.log
rm -f -r "/tmp/error_chmod_docker.log"

# creation du docker du projet
if docker compose up -d ; then

  if [ $TYPE_INSTALL_PROJECT = "install" ]
  then
    if ! ${0%/*}/bin/install/createProject.sh ; then
      exit 1
    fi
  else
    if ! ${0%/*}/bin/install/updateProject.sh ; then
      exit 1
    fi
  fi

  if ! ${0%/*}/start.sh ; then
    exit 1
  fi

  if ! rm -f -r "${0%/*}/tmp_install" ; then
    exit 1
  fi

  ${0%/*}/bin/install/display_web.sh

fi
