#!/usr/bin/env bash

pwd
ls -la

exec /opt/pharo/pharo /home/foliage/foliage.image --no-default-preferences clap foliage "$@"
