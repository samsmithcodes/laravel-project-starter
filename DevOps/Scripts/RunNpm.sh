#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd $SCRIPT_DIR
source __global.sh

cd ../DockerCompose

project-docker-compose exec node $@