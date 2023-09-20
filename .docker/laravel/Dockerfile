FROM php:fpm

VOLUME "/var/log/symfony/"
VOLUME "/var/log/symfony/"

VOLUME "/home/project"
WORKDIR "/home/project"

COPY startserver /etc/init.d/

RUN chmod +x /etc/init.d/startserver
RUN update-rc.d startserver defaults

RUN set -ex
RUN apt update
RUN apt upgrade -y  
RUN apt install -y libxml2-dev 
RUN apt install -y libldb-dev
RUN apt install -y libldap2-dev
RUN apt install -y libssl-dev
RUN apt install -y libxslt-dev
RUN apt install -y wget
RUN apt install -y graphviz
RUN apt install -y libzip-dev
RUN apt install -y vim
RUN apt install -y curl
RUN apt install -y debconf
RUN apt install -y subversion
RUN apt install -y apt-transport-https
RUN apt install -y apt-utils
RUN apt install -y build-essential
RUN apt install -y locales
RUN apt install -y acl
RUN apt install -y mailutils
RUN apt install -y wget
RUN apt install -y libjpeg-dev
RUN apt install -y libpng-dev
RUN apt install -y libmcrypt-dev
RUN apt install -y unzip
RUN apt install -y libyaml-dev
RUN apt install -y libc-client-dev
RUN apt install -y libkrb5-dev
RUN apt install -y sendmail
RUN apt install -y ssmtp
RUN apt install -y curl
RUN apt install -y git

RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install xsl
RUN docker-php-ext-install zip
RUN docker-php-ext-configure gd --with-jpeg
RUN docker-php-ext-install gd
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl
RUN docker-php-ext-install imap
    
# Goto temporary directory.
WORKDIR "/tmp"

RUN pecl install -o -f xdebug

# Install composer  
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer  
RUN mkdir /var/composer  
ENV COMPOSER_HOME /var/composer  
ENV COMPOSER_ALLOW_SUPERUSER 1 

RUN composer global require laravel/installer
RUN export PATH=$PATH:/var/composer/vendor/bin/

WORKDIR "/home/project"

CMD service startserver start && tail -F /var/log/laravel/error.log && php-fpm
