#!/usr/bin/env bash

# Get script directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

sudo rm -rf "${DIR}/emby" "${DIR}/jellyfin" "${DIR}/plex"

git reset --hard HEAD
