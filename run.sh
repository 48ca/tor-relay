#!/bin/bash -e

docker build -t tor-relay .

PORT=9001

docker run \
    -v /etc/localtime:/etc/localtime \
    -v $PWD/tor:/var/lib/tor/.tor \
    --restart always \
    -p $PORT:9001 \
    -e RELAY_TYPE=middle \
    --env-file tor.env \
    -e RELAY_PORT=$PORT \
    tor-relay \
    --privileged
