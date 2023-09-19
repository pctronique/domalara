# domalara

pecl install -o -f xdebug

composer config -g repo.packagist composer https://packagist.org

composer global require laravel/installer

./var/composer/vendor/laravel/installer/bin/laravel
./var/composer/vendor/bin/laravel

ln /var/composer/vendor/laravel/installer/bin/laravel /usr/bin/laravel
composer global require autoload --dev

composer create-project laravel/laravel projectLaravel

php artisan serve

php artisan serve --host 0.0.0.0

