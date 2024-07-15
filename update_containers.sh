#!/usr/bin/env bash

# Get script directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

export PGID
PGID=$(id -g)
export PUID
PUID=$(id -u)

# Run DIR/start_containers.sh
"${DIR}/start_containers.sh"

# Wait for containers to start
sleep 30

docker-compose -f "${DIR}/plex/docker-compose.yml" down
docker-compose -f "${DIR}/jellyfin/docker-compose.yml" down
docker-compose -f "${DIR}/emby/docker-compose.yml" down
