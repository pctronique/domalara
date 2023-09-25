while read line  
do   
   export $line
done < ${0%/*}/.env
cd /home/project/$FOLDER_PROJECT
php artisan serve --host 0.0.0.0 >> /var/log/laravel/laravel_out.log 2>> /var/log/laravel/laravel_error.log & 
