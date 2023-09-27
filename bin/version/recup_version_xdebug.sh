#!/bin/bash
FOLDER_BASE="${0%/*}/../.."
FOLDER_DOCKER="$FOLDER_BASE/.docker"
FOLDER_ENV_DEF="$FOLDER_DOCKER/file_env"

while read line  
do   
   if [ ! -z "$line" ]
   then
      export $line
   fi
done < $FOLDER_ENV_DEF/.env

commande='php -r "phpinfo(INFO_GENERAL);"'

${0%/*}/version_in_project.sh "$commande"

cp ${0%/*}/../../$PROJECT_TMP_MAIN/recup_tmp_version.txt ${0%/*}/../../$PROJECT_TMP_MAIN/recup_tmp_info.txt

if ! ${0%/*}/../install/project_bash.sh "rm -r -f $PROJECT_TMP/recup_tmp_version.txt" ; then
   exit 1
fi

while read line  
do
   line=$(echo $line | tr '[:upper:]' '[:lower:]')
   if [[ "$line" =~ "xdebug" ]];
   then
      echo "$line" >> ${0%/*}/../../$PROJECT_TMP_MAIN/recup_tmp_version.txt
   fi
done < ${0%/*}/../../$PROJECT_TMP_MAIN/recup_tmp_info.txt

${0%/*}/recup_version.sh

value_vers=""

while read lineVers 
do
   value_vers="$lineVers"
done < ${0%/*}/../../$PROJECT_TMP_MAIN/recup_valide_version.txt

echo "XDEBUG_VERSION=$value_vers" >> "${0%/*}/../../$PROJECT_TMP_MAIN/env_version.txt"
