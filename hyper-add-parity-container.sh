#!/usr/bin/env bash

DATE_TAG=$1
echo ${DATE_TAG}
AWS_IMAGE=151295780340.dkr.ecr.eu-west-2.amazonaws.com/parity:private-${DATE_TAG}

eval $(aws ecr get-login | sed 's/docker/hyper/') && \
hyper run -d \
--size M3 \
--publish 22:22 \
--restart=unless-stopped \
--hostname parity-private.local \
--name parity-private \
--volume parity-private:/data \
${AWS_IMAGE} && \
hyper fip attach -f 209.177.91.31 parity-private
