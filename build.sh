#!/bin/bash

docker build --build-arg UID=1000 --build-arg USERNAME=ben -t playonlinux .
