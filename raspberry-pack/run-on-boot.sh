#!/bin/bash

# copy .env file to permanent location
sudo cp /boot/raspberry-pack/.env /home/pi/

# install docker
sudo curl -fsSL https://get.docker.com | sh

# clone files that where provided
if [[ "$DOCKER_FILES_GIT" != "" ]]
then
      cd /home/pi/
      echo "repository found: retrieving files"
      git clone $DOCKER_FILES_GIT dockerfiles
else
      echo "no repository"
fi
