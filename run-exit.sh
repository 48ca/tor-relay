#!/bin/bash -e

docker build -t tor-relay .

docker run \
    -v /etc/localtime:/etc/localtime \
    --restart always \
    -p 9001:9001 \
    --name tor-exit-relay \
    --env-file tor.env \
    -e RELAY_TYPE=exit \
    tor-relay \
    --privileged
