#!/bin/bash
echo \$MY_VAR
export exportedFromBash=MY_VAR
echo "The value of BAZ is after: $1 $2"
# docker-compose -f docker-compose.yml up --build -d