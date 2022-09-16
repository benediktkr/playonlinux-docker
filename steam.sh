#!/bin/bash

mkdir -p ~/playonlinux

docker run --rm -it --privileged \
  --device /dev/dri/card0:/dev/dri/card0 \
  -e DISPLAY=:0 \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -v /dev/snd:/dev/snd:rw \
  -v ~/playonlinux:/home/ben:rw \
  playonlinux --run Steam
