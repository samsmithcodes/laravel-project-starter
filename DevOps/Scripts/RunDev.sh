#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


cd laravel-project

if [ -f ".env" ]
then
    rm .env
fi

cp ../DevOps/EnvTemplates/.env.dev .env

cd $SCRIPT_DIR
source __global.sh

cd ../DockerCompose

project-docker-compose up -d --pull always

sleep 30

project-docker-compose exec app composer install
bash -c "cd ../../laravel-project && bash ../DevOps/Scripts/BuildAssets.sh"

project-docker-compose exec app php artisan key:generate
project-docker-compose exec app php artisan migrate
project-docker-compose exec app php artisan storage:link
project-docker-compose exec app php artisan cache:clear
project-docker-compose exec app php artisan view:clear
project-docker-compose exec app php artisan config:clear