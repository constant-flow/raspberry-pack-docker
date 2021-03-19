#!/bin/bash

# setup environment variables
set -a
. /home/pi/.env
set +a

# update files to current state of repository
if [[ "$DOCKER_FILES_GIT" != "" ]]
then
    cd /home/pi/dockerfiles/
    sudo git pull
fi

# run specified image with options, a command and its arguments
$DOCKER_COMMANDS