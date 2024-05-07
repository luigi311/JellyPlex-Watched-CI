#!/usr/bin/env bash

export PGID
PGID=$(id -g)
export PUID
PUID=$(id -u)

sudo chown -R "${PUID}:${PGID}" ./*

docker pull lscr.io/linuxserver/plex &
docker pull lscr.io/linuxserver/jellyfin &
docker pull lscr.io/emby/embyserver &

wait

docker-compose -f plex/docker-compose.yml up -d 
docker-compose -f jellyfin/docker-compose.yml up -d
docker-compose -f emby/docker-compose.yml up -d

# Wait for containers to start
sleep 15

docker-compose -f plex/docker-compose.yml down
docker-compose -f jellyfin/docker-compose.yml down
docker-compose -f emby/docker-compose.yml down