#!/usr/bin/env bash

ls -l /home/runner/work/

ls -l /home/runner/work/pharo-site

ls -l /home/runner/work/pharo-site/pharo-site/


exec /opt/pharo/pharo /home/foliage/foliage.image --no-default-preferences clap foliage $@
