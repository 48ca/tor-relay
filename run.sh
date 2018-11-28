#!/bin/bash -e

docker build -t tor-relay .

PORT=54252

docker run \
    -v /etc/localtime:/etc/localtime \
    --restart always \
    -p $PORT:9001 \
    --env-file tor.env \
    -e RELAY_PORT=$PORT \
    tor-relay \
    --privileged
