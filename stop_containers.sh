#!/usr/bin/env bash

# Get script directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

export PGID
PGID=$(id -g)
export PUID
PUID=$(id -u)

docker compose -f "${DIR}/plex/docker-compose.yml" down
docker compose -f "${DIR}/jellyfin/docker-compose.yml" down
docker compose -f "${DIR}/emby/docker-compose.yml" down
