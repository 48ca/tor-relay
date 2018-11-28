# Tor Relay with Docker
This is a Dockerfile that can be used to run the three kinds of Tor relays: middle relays, exits, and bridges.
This is based on [Jessie Frazelle](https://github.com/jessfraz)'s Dockerfile.

## Quick Start
Copy `tor.env.sample` to another file and make appropriate changes.
You can add any enviroment variables you want to it (i.e. `RELAY_PORT`),
I do not simply to show that you must forward that port to the container when you start the container.

```
PORT=9001 # Can be anything that is not blocked by your firewall
docker run --env-file=tor.env.sample \
    -e RELAY_PORT=$PORT \
    -p $PORT:9001 \
    -v /etc/localtime:/etc/localtime \
    --restart always \
    jhoughton/tor-relay
```

You can also use the provided run script.
