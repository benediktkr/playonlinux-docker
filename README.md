# `playonlinux-docker`

[![Build Status](https://jenkins.sudo.is/buildStatus/icon?job=ben%2Fplayonlinux-docker%2Fmain&style=flat-square)](https://jenkins.sudo.is/job/ben/job/playonlinux-docker/job/main/)
[![git](docs/img/shields/git.sudo.is-ben-playonlinux-docker.svg)](https://git.sudo.is/ben/playonlinux-docker)
[![github](https://www.sudo.is/readmes/github-benediktkr.svg)](https://github.com/benediktkr/playonlinux-docker)
![Docker pulls](https://img.shields.io/docker/pulls/benediktkr/playonlinux?sort=semver&color=blue&style=flat-square)
![Image size](https://img.shields.io/docker/image-size/benediktkr/playonlinux/latest?sort=semver&label=size&style=flat-square)
[![matrix](https://www.sudo.is/readmes/matrix-ben-sudo.is.svg)](https://matrix.to/#/@ben:sudo.is)

A docker container for [PlayOnLinux](https://www.playonlinux.com/en/),
using Ubuntu 22.04 as the base image.

![Screenshot of PlayOnLinux running in Docker](docs/img/scrot.png#center)

## Usage

First create a directory for the PlayOnLinux data:

```console
$ mkdir ~/playonlinux
```

Pull and run the [`benediktkr/playonlinux` image from dockerhub](https://git.sudo.is/ben/playonlinux-docker/raw/branch/main/scrot.png):

```console
$ docker run --rm -it --privileged --device /dev/dri/card0:/dev/dri/card0  -e DISPLAY=:0  -v /tmp/.X11-unix:/tmp/.X11-unix:rw -v /dev/snd:/dev/snd:rw -v ~/playonlinux:/home/player:rw benediktkr/playonlinux:latest
```

If you want to run with a different UID and/or username, you can build the image.

### 3d hardware acceleration

Hardware accelertion is possible, but you may have to install the correct drivers in
the `Dockerfile` (pull requests welcome). The Intel drivers are installed by default
in the Ubuntu image.

To pass your card to the container (as tested on an Intel card):

```shell
--device /dev/dri/card0:/dev/dri/card0
```

Modify as needed for other cards.

## Build

To build with the default username `player` and UID `1000`:

```console
$ git clone https://git.sudo.is/ben/playonlinux-docker
$ docker build -t playonlinux .
```

If you need or want to use a different UID or username:

```console
$ docker build --build-arg UID=1001 --build-arg USER_NAME=user -t playonlinux .
```

## Running the container

Start PlayOnLinux:

```console
$ mkdir ~/playonlinux
$ docker run --rm -it \
  --privileged \
  --device /dev/dri/card0:/dev/dri/card0 \
  -e DISPLAY=:0 \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -v /dev/snd:/dev/snd:rw \
  -v ~/playonlinux:/home/player:rw \
  playonlinux
```

Starting Steam:

```console
$ docker run --rm -it \
  --privileged \
  --device /dev/dri/card0:/dev/dri/card0 \
  -e DISPLAY=:0 \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -v /dev/snd:/dev/snd:rw \
  -v ~/playonlinux:/home/player:rw \
  playonlinux --run Steam
```

The `ENTRYPOINT` of the container is the `playonlinux` binary, and any arguments you
pass are passed to it.

These examples pass `--rm` to `docker run` to avoid leaving lingering stopped containers,
so you should mount `/home/player` to a directory to keep your installs and game saves.

## Source

Git repo: [git.sudo.is/ben/playonlinux-docker](https://git.sudo.is/ben/playonlinux-docker)

GitHub: [benediktkr/playonlinux-docker](https://github.com/benediktkr/playonlinux-docker)

Docker Hub: [benediktkr/playonlinux](https://hub.docker.com/r/benediktkr/playonlinux)
