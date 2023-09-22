./bin/install/start_install.sh

#./bin/install/message.sh

if [ ! -e .env ]
then
    exit 1
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
chmod 777 -R project
chmod 777 -R projecttmp

# creation du docker du projet
if docker-compose up --build -d ; then
    ./bin/createProject.sh
    #./bin/updateProject.sh
    ./start.sh

    ./bin/install/end_install.sh
fi
