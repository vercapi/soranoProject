#!/bin/sh

rm -f /home/plex/Library/Application\ Support/Plex\ Media\ Server/plexmediaserver.pid
echo "Starting Plex Media Server"
su -c 'cd /usr/lib/plexmediaserver && ./start.sh' plex
