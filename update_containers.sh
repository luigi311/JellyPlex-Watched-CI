#!/usr/bin/env bash

export PGID
PGID=$(id -g)
export PUID
PUID=$(id -u)

./start_containers.sh

# Wait for containers to start
sleep 15

docker-compose -f plex/docker-compose.yml down
docker-compose -f jellyfin/docker-compose.yml down
docker-compose -f emby/docker-compose.yml down