#!/bin/bash
BUILD_SHA=`git rev-parse --short HEAD`
REPOSITORY=kikobr82
TAG=tech-test-1

docker tag ${TAG} ${REPOSITORY}/${TAG}:${BUILD_SHA} 
docker push ${REPOSITORY}/${TAG}:${BUILD_SHA} 