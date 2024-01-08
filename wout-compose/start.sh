#!/bin/bash

MONGO_USERNAME=mongoadmin
MONGO_PWD=secret

ID1=$(docker ps -aqf "name=feedback-back")
ID2=$(docker ps -aqf "name=feedback-mongo")
ID3=$(docker ps -aqf "name=feedback-front")
docker stop $ID1 $ID2 $ID3 && docker rm $ID1 $ID2 $ID3

docker system prune -f --volumes

docker run -it -d -p 27017:27017 --name feedback-mongo \
        -e MONGO_INITDB_ROOT_USERNAME=$MONGO_USERNAME \
        -e MONGO_INITDB_ROOT_PASSWORD=$MONGO_PWD \
        mongo

ID=$(docker ps -aqf "name=feedback-mongo")

docker run -d -p 8000:8000 --privileged --pull=always --name feedback-back \
        -e MONGODB_URL="mongodb://$MONGO_USERNAME:$MONGO_PWD@172.17.0.1:27017/" \
        -e MAIL_USERNAME=axel.zublena.2 \
        -e MAIL_PASSWORD="" \
        -e MAIL_FROM=axel.zublena.2@gmail.com \
        -e MAIL_PORT=465 \
        -e MAIL_SERVER=smtp.gmail.com \
        -e BACKEND_HOST=amp.test.axelzublena.com \
        ghcr.io/zesty-surprise/feedback-backend:develop

docker run -d -p 3000:3000 --pull=always --name feedback-front \
        -e PUBLIC_BACKEND_URI="https://amp.test.axelzublena.com/api/" \
        ghcr.io/zesty-surprise/feedback-frontend:develop
