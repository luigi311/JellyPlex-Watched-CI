#!/usr/bin/env bash

# Get script directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

export PGID
PGID=$(id -g)
export PUID
PUID=$(id -u)

sudo chown -R "${PUID}:${PGID}" "${DIR}"/*

docker pull lscr.io/linuxserver/plex &
docker pull lscr.io/linuxserver/jellyfin &
docker pull emby/embyserver &

wait

docker compose -f "${DIR}/plex/docker-compose.yml" up -d
docker compose -f "${DIR}/jellyfin/docker-compose.yml" up -d
docker compose -f "${DIR}/emby/docker-compose.yml" up -d
