#!/bin/sh

set -e

export IMAGE=playonlinux:latest

echo "pushing to dockerhub as benediktkr/${IMAGE}"
docker tag ${IMAGE} benediktkr/${IMAGE}
docker push benediktkr/${IMAGE}

echo

echo "pushing to git.sudo.is as ben/${IMAGE}"
docker tag ${IMAGE} git.sudo.is/ben/${IMAGE}
docker push git.sudo.is/ben/${IMAGE}
