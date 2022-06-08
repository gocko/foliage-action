#!/usr/bin/env bash

# just to see where am I
echo "$(pwd)"

exec /opt/pharo/pharo /home/foliage/foliage.image clap foliage "$@"
