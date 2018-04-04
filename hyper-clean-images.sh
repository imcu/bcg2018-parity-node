#!/usr/bin/env bash
TAG=$1
hyper images | grep ${TAG} | awk '{print $3}' | xargs hyper rmi
hyper images