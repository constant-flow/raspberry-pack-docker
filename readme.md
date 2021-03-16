# Docker – Raspberry-Pack
This image allows to install docker on a Raspberry Pi. The image that will run is defined by the user at installation of the Pi

# How to use
- Get Raspberry-Pack ([clone & install & run](https://github.com/constant-flow/raspberry-pack#getting-started))
- Add this project's git-url (`git@github.com:constant-flow/raspberry-pack-docker.git`) as a remote package

# How to run docker with this
- This packages runs the `docker run [A] [B] [D] [C]` command where:
    - `[A]` = `DOCKER_RUN_OPTIONS`: are the options to run the image with (e.g. `-d -p 80:80`)
    - `[B]` = `DOCKER_RUN_IMAGE`: is the image you want to run (e.g. `alpine`)
    - `[C]` = `DOCKER_RUN_COMMAND`: is the command you want to run in the container (e.g. `bash`)
    - `[D]` = `DOCKER_RUN_ARGUMENTS`: are the parameters to the command you run (e.g `--posix`)
- `[A]` - `[D]` can be specified in the Raspberry-Pack wizard after you added this package