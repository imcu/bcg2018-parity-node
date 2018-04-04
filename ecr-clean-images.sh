#!/usr/bin/env bash
TAG=$1
REPO=parity
IMAGES=`aws ecr list-images  --repository-name ${REPO} | jq -c '.imageIds[] | select(.imageTag | contains('\"${TAG}\"')) | .imageTag'`
for IMG in ${IMAGES}; do
  IMG=`echo ${IMG} | sed 's/\"//g'`
  aws ecr batch-delete-image --repository-name ${REPO} --image-ids imageTag=${IMG}
done
