#!/bin/bash

ID1=$(docker ps -aqf "name=feedback-back")
ID2=$(docker ps -aqf "name=feedback-mongo")
docker stop $ID1 $ID2 && docker rm $ID1 $ID2
docker system prune -f --volumes
