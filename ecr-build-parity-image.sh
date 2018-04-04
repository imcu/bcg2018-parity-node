#!/usr/bin/env bash

DATE_TAG=`date +"%F--%T" | sed "s/\:/\-/g"`
AWS_IMAGE=151295780340.dkr.ecr.eu-west-2.amazonaws.com/parity:private-${DATE_TAG}

docker build -t ${AWS_IMAGE} .
docker tag parity:${DATE_TAG} ${AWS_IMAGE}
eval $(aws ecr get-login | sed "s/-e none//g")
docker push ${AWS_IMAGE}
echo "TAG: ${DATE_TAG}"
