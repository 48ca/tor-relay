#!/bin/bash -e

docker build -t tor-relay .

docker run \
    -v /etc/localtime:/etc/localtime \
    --restart always \
    -p 9001:9001 \
    --env-file tor.env \
    tor-relay \
    --privileged
