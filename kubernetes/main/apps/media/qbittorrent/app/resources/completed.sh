#!/bin/bash
# qBittorrent settings > 'Run external program on torrent finished'
# /scripts/completed.sh "%F"
/bin/chmod -R 750 "$1"

printf "Searching cross-seed for '%s' with tags '%s'\n" "$1"
/usr/bin/curl \
    --silent \
    --connect-timeout 5 \
    --max-time 10 \
    --retry 5 \
    --retry-delay 0 \
    --retry-max-time 40 \
    --request POST \
    --data-urlencode "path=$1" \
    http://cross-seed.media.svc.cluster.local/api/webhook

exit 0
