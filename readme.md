# Docker – Raspberry-Pack

This image allows to install docker on a Raspberry Pi. The image that will run is defined by the user at installation of the Pi

## How to use

- Get Raspberry-Pack ([clone & install & run](https://github.com/constant-flow/raspberry-pack#getting-started))
- Add this project's git-url (`git@github.com:constant-flow/raspberry-pack-docker.git`) as a remote package

## How to run docker with this

- First you can provide a url to a repository. Here you can put all files like a Dockerfile and/or its assets `DOCKER_FILES_GIT`. They will be created in `/home/pi/dockerfiles`.
- After this the packages runs the `DOCKER_COMMANDS`, some examples:
  - **Run image from registry:** `sudo docker --rm run ...`
  - **Build and run an image from repo:** `sudo docker build -t [imagename] /home/pi/dockerfiles; sudo docker run --rm ... [imagename]`

## Example: Run a Dockerfile hosted on a git repo

- **DOCKER_FILES_GIT** : `https://github.com/[user-or-group]/[project-with-dockerfile]`
- **DOCKER_COMMANDS** : `sudo docker build -t build-image /home/pi/dockerfiles; sudo docker run --rm -p 80:80 build-image`

## Example: Host a static website with Apache from a git repo (containing website only)

In this example we use the repository only to store a website.
It doesn't require a Dockerfile, as httpd can be used from the official docker registry.
As we want to access the website on the hosts port 80 we bind the containers port 80 to it
To access the hosted site, we simply mount the website to the expected folder, so https serves it.

- **DOCKER_FILES_GIT** : `https://github.com/[user-or-group]/[project-with-static-website]`
- **DOCKER_COMMANDS** : `sudo docker run --rm --name my-app -p 80:80 -v "/home/pi/dockerfiles/":/usr/local/apache2/htdocs/ httpd:2.4-alpine`
