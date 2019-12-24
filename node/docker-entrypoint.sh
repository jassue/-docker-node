#!/bin/sh

set -e

if [ -f "./pm2.conf.json" ]; then
    pm2 start pm2.conf.json --env $NODE_ENV
fi

exec node
