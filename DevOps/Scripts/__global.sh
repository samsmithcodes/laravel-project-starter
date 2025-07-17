#!/bin/bash

export COMPOSE_PROJECT_NAME=laravel

project-docker-compose () {
    docker compose --file dev.yml --env-file ../../laravel-project/.env $@
}
