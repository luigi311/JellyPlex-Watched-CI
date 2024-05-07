#!/usr/bin/env bash

sudo chown -R "${PUID}:${PGID}" ./*

docker pull lscr.io/linuxserver/plex &
docker pull lscr.io/linuxserver/jellyfin &
docker pull emby/embyserver &

wait

docker-compose -f plex/docker-compose.yml up -d 
docker-compose -f jellyfin/docker-compose.yml up -d
docker-compose -f emby/docker-compose.yml up -d