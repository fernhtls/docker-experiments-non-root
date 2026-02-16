#!/bin/bash
# Init script to change the permission within the updater container
# in order to run as app
chown -R 101:101 /output
exec "$@"
