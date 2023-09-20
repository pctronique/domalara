# domalara

pecl install -o -f xdebug

composer config -g repo.packagist composer https://packagist.org

composer global require laravel/installer

./var/composer/vendor/laravel/installer/bin/laravel
./var/composer/vendor/bin/laravel

/var/composer/vendor/bin/laravel
/var/composer/vendor/laravel/installer/bin/laravel

ln /var/composer/vendor/laravel/installer/bin/laravel /usr/bin/laravel
composer global require autoload --dev

composer create-project laravel/laravel www

php artisan serve

php artisan serve --host 0.0.0.0

composer global require laravel/installer
export PATH=$PATH:/var/composer/vendor/bin/
laravel new www

php artisan serve --host 0.0.0.0 >> ../../projecttmp/logs/laravel/laravel_out.log 2>> ../../projecttmp/logs/laravel/laravel_error.log & 
