#!/usr/bin/env bash

set -eu

service=${1:-}
image=${2:-}
tag=${3:-latest}

# read param
. .param

fullname="gcr.io/${PROJECT_ID}/${image}:${tag}"

gcloud compute instances create-with-container ${service} \
    --container-image=${fullname} \
    --container-env-file=.env \
    --container-restart-policy=never \
    --machine-type=${MACHINE_TYPE} \
    --service-account=${SERVICE_ACCOUNT}
