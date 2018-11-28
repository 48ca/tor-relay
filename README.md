# Tor Relay with Docker
This is a Dockerfile that can be used to run both Tor relays and Tor bridges.
This is based on [Jessie Frazelle](https://github.com/jessfraz)'s Dockerfile.

## Quick Start
Copy `tor.env.sample` to another file and make appropriate changes.

```
PORT=9001 # Can be anything that is not blocked by your firewall
docker run --env-file=tor.env.sample \
    -e RELAY_PORT=$PORT \
    -p $PORT:9001 \
    -v /etc/localtime:/etc/localtime \
    --restart always \
    jhoughton/tor-relay
```

You can also use the provided run scripts.
