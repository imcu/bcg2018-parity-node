#!/usr/bin/env bash

DATE_TAG=$1
echo ${DATE_TAG}
AWS_IMAGE_NAME=151295780340.dkr.ecr.eu-west-2.amazonaws.com/parity:private-${DATE_TAG}

docker run -d \
--publish 2222:22 \
--restart=unless-stopped \
--hostname parity-private.local \
--name parity-private \
--volume ${PWD}/parity-private:/data \
${AWS_IMAGE_NAME}
