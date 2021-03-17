# Docker – Raspberry-Pack

This image allows to install docker on a Raspberry Pi. The image that will run is defined by the user at installation of the Pi

## How to use

- Get Raspberry-Pack ([clone & install & run](https://github.com/constant-flow/raspberry-pack#getting-started))
- Add this project's git-url (`git@github.com:constant-flow/raspberry-pack-docker.git`) as a remote package

## How to run docker with this

- First you can provide a url to a repository. Here you can put all files that can be used by the Dockerfile `DOCKER_FILES_GIT`. They will be created in `/home/pi/dockerfiles`.
- After this the packages runs the `docker run [A] [B] [D] [C]` command where:
  - `[A]` = `DOCKER_RUN_OPTIONS`: are the options to run the image with (e.g. `-d -p 80:80`)
  - `[B]` = `DOCKER_RUN_IMAGE`: is the image you want to run (e.g. `alpine`)
  - `[C]` = `DOCKER_RUN_COMMAND`: is the command you want to run in the container (e.g. `bash`)
  - `[D]` = `DOCKER_RUN_ARGUMENTS`: are the parameters to the command you run (e.g `--posix`)
- `[A]` - `[D]` can be specified in the Raspberry-Pack wizard after you added this package

## Example: Host a static website with Apache from a git repo (containing website only)

Using it straight with docker would mean to call it

**🚫 without raspberry-pack**

```
cd /home/pi/
git clone https://github.com/[user-or-group]/[project-with-static-website] dockerfiles
docker run -dit --name my-apache-app -p 80:80 -v "/home/pi/dockerfiles/":/usr/local/apache2/htdocs/ httpd:2.4-alpine
```

**✅ with raspberry-pack**

You can reach the same result by answering the questions:

- **Provide a repo-url where the files are located, this Dockerfile might use** : `https://github.com/[user-or-group]/[project-with-static-website]`
- **options to run the image with (e.g. -d -p 80:80)** : `-dit --name my-apache-app -p 80:80 -v "/home/pi/dockerfiles/":/usr/local/apache2/htdocs/`
- **specify the image (e.g. alpine)** : `httpd:2.4-alpine`
- **command to run in container (e.g. bash)** : ``
- **arguments for the command docker run** : ``
