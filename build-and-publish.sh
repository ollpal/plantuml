#!/bin/bash
set -e

VERSION=$(curl -fqs https://plantuml.com/changes | tr '<' '\n<' | grep 'h2>.*20[0-9][0-9]\.' | sed 's/ (.*//' | sed 's/.*>V//' | head -n1)

IMAGE=ollpal/plantuml

docker build --build-arg VERSION=$VERSION --build-arg http_proxy=$http_proxy --build-arg https_proxy=$https_proxy --tag $IMAGE:$VERSION .
docker push $IMAGE:$VERSION

docker tag $IMAGE:$VERSION $IMAGE:latest
docker push $IMAGE:latest
