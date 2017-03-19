#!/bin/sh

# cd into our directory
cd /data/app

if [ ! -f /data/installed ]; then
  /data/install.sh
fi

# start our node.js application
exec pm2-docker start --auto-exit --env production process.yml
