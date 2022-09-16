# playonlinux-docker

a docker container with [PlayOnLinux](https://www.playonlinux.com/en/), using Ubuntu 22.04 as the base image.

## usage

first create a directory for the PlayOnLinux data:

```shell
mkdir ~/playonlinux
```

pull and run the image from dockerhub:

```shell
docker run --rm -it --privileged \
  --device /dev/dri/card0:/dev/dri/card0 \
  -e DISPLAY=:0 \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -v /dev/snd:/dev/snd:rw \
  -v ~/playonlinux:/home/player:rw \
  benediktkr/playonlinux:latest
```

if you want to run with a different UID and/or username, you can build the image.

## 3d hardware acceleration

hardware accelertion is possible, but you may have to install the correct drivers in 
the `Dockerfile` (pull requests welcome). the intel drivers are installed by default
in the ubuntu image. 

to pass your card to the container (as tested on an intel card):

```shell
--device /dev/dri/card0:/dev/dri/card0 
```

modify as needed for other cards

## build

to build with the default username `player` and UID `1000`:

```shell
git clone https://git.sudo.is/ben/playonlinux-docker
docker build -t playonlinux .
```

if you need or want to use a different UID or username:

```shell
docker build --build-arg UID=1001 --build-arg USERNAME=user -t playonlinux .
```

## running the container

start PlayOnLinux:

```shell
docker run --rm -it --privileged \
  --device /dev/dri/card0:/dev/dri/card0 \
  -e DISPLAY=:0 \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -v /dev/snd:/dev/snd:rw \
  -v ~/playonlinux:/home/player:rw \
  playonlinux
```

starting Steam:

```shell
docker run --rm -it --privileged \
  --device /dev/dri/card0:/dev/dri/card0 \
  -e DISPLAY=:0 \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -v /dev/snd:/dev/snd:rw \
  -v ~/playonlinux:/home/player:rw \
  playonlinux --run Steam
```

the `ENTRYPOINT` of the container is the `playonlinux` binary, and any arguments you 
pass are passed to it. 

these examples pass `--rm` to `docker run` to avoid leaving lingering stopped containers,
so you should mount `/home/player` to a directory to keep your installs and game saves. 
