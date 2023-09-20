while read line  
do   
   export $line
done < ${0%/*}/.env
cd /home/project/$FOLDER_PROJECT_LARAVEL
php artisan serve --host 0.0.0.0 >> ../../projecttmp/logs/laravel/laravel_out.log 2>> ../../projecttmp/logs/laravel/laravel_error.log & 
