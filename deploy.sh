#!/bin/bash
echo \$MY_VAR
export exportedFromBash=MY_VAR
echo "The value of BAZ is after: $1 $2"
echo "docker version...."
docker-compose --version
echo "...................$ENV"
 echo "The value of MY_VAR is: $ENVFILE"
# docker-compose -f docker-compose.yml up --build -d
