#!/bin/bash
export exportedFromBash=TEST-VAR
echo "The value of BAZ is after: $1"
docker-compose -f docker-compose.yml up --build -d