#!/bin/bash
echo \$MY_VAR
export exportedFromBash=MY_VAR
# echo "docker version...."
# docker-compose --version
echo "...................$ENV"
 echo ".....environment variables from file: $ENVFILE"
#docker-compose -f docker-compose.yml --env-file .\$ENVFILE up --build -d
