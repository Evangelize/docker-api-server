#!/bin/bash
set -e

MYSQL_HOST=${MYSQL_HOST:-db.dinescout.io}
MYSQL_USERNAME=${MYSQL_USERNAME:-classes}
MYSQL_PASSWORD=${MYSQL_PASSWORD:-}
MYSQL_DATABASE=${MYSQL_DATABASE:-}

REDIS_HOST=${REDIS_HOST:-redis.dinescout.io}
REDIS_PORT=${REDIS_PORT:-6379}
REDIS_TTL=${REDIS_TTL:-43200}
REDIS_DB=${REDIS_DB:-0}

if [ ! -f /data/app/config/settings.json ]; then
cp -- "/data/dist/settings.json.dist" "/data/app/config/settings.json"
cp -- "/data/dist/config.json.dist" "/data/app/config/config.json"
# configure settings.json
sed 's/{{MYSQL_HOST}}/'${MYSQL_HOST}'/' -i /data/app/config/settings.json
sed 's/{{MYSQL_USERNAME}}/'${MYSQL_USERNAME}'/' -i /data/app/config/settings.json
sed 's/{{MYSQL_PASSWORD}}/'${MYSQL_PASSWORD}'/' -i /data/app/config/settings.json
sed 's/{{MYSQL_DATABASE}}/'${MYSQL_DATABASE}'/' -i /data/app/config/settings.json

sed 's/{{REDIS_HOST}}/'${REDIS_HOST}'/' -i /data/app/config/settings.json
sed 's/{{REDIS_PORT}}/'${REDIS_PORT}'/' -i /data/app/config/settings.json
sed 's/{{REDIS_DB}}/'${REDIS_DB}'/' -i /data/app/config/settings.json

sed 's/{{MYSQL_HOST}}/'${MYSQL_HOST}'/' -i /data/app/config/config.json
sed 's/{{MYSQL_USERNAME}}/'${MYSQL_USERNAME}'/' -i /data/app/config/config.json
sed 's/{{MYSQL_PASSWORD}}/'${MYSQL_PASSWORD}'/' -i /data/app/config/config.json
sed 's/{{MYSQL_DATABASE}}/'${MYSQL_DATABASE}'/' -i /data/app/config/config.json
fi

touch /data/installed
