#!/bin/bash -e

docker build -t tor-relay .

docker run \
    -v /etc/localtime:/etc/localtime \
    --restart always \
    -p 9001:9001 \
    -e RELAY_TYPE=middle \
    --env-file tor.env \
    tor-relay \
    --privileged
