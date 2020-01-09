#!/usr/bin/env bash

set -eu

image=${1:-}
tag=${2:-latest}

# read param
. .param

fullname="gcr.io/${PROJECT_ID}/${image}:${tag}"

# read setting file
docker build -t ${image}:${tag} .
docker tag ${image}:${tag} ${fullname}
docker push ${fullname}
echo "image successfully pushed to: ${fullname}"