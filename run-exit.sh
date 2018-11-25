#!/bin/bash -e

docker build -t tor-relay .

docker run \
    -v /etc/localtime:/etc/localtime \
    --restart always \
    -p 9001:9001 \
    --name tor-exit-relay \
    tor-relay \
    --env-file tor.env \
    --privileged
