#!/bin/sh

# cd into our directory
cd /data/app

if [ ! -f /data/installed ]; then
  /data/install.sh
fi

# start our node.js application
exec npm run prod;
