# playonlinux-docker

a docker container with PlayOnLinux, base image is Ubuntu 22.04.

## build

with default `$USERNAME=player` and `$UID=1000`:

```shell
docker build -t playonlinux .
```

if you need or want to use a different UID or username:

```shell
docker build --build-arg UID=1001 --build-arg USERNAME=user -t playonlinux .
```

## run

start PlayOnLinux:

```shell
mkdir ~/playonlinux

docker run --rm -it --privileged \
  --device /dev/dri/card0:/dev/dri/card0 \
  -e DISPLAY=:0 \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -v /dev/snd:/dev/snd:rw \
  -v ~/playonlinux:/home/ben:rw \
  playonlinux
```

starting Steam:

```shell
docker run --rm -it --privileged \
  --device /dev/dri/card0:/dev/dri/card0 \
  -e DISPLAY=:0 \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -v /dev/snd:/dev/snd:rw \
  -v ~/playonlinux:/home/ben:rw \
  playonlinux --run Steam
```

