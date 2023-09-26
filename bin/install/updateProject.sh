while read line  
do   
   export $line
done < ${0%/*}/../.env
if ! ${0%/*}/project_bash.sh "cd $FOLDER_PROJECT && composer install" ; then
    exit 1
fi

exit 0
