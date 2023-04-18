#!/bin/bash
echo \$MY_VAR
export exportedFromBash=MY_VAR
# echo "docker version...."
# docker-compose --version
echo ".......building from............$ENV"
 echo ".....environment variables from file: $FILE_CREDS"
#docker-compose -f docker-compose.yml --env-file .\$ENVFILE up --build -d
