#!/bin/bash

set -xe
pwd
#loging into Ecr
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 123456789.dkr.ecr.ap-south-1.amazonaws.com/node-test
#created tag for docker images
COMMIT_ID=$(git rev-parse --short $GIT_COMMIT)
TAG=Dev-$COMMIT_ID-$BUILD_NUMBER
echo $TAG

#creating docker image
docker build -t 123456789.dkr.ecr.ap-south-1.amazonaws.com/node-test:$TAG .
#pushing docker image to ecr
docker push 123456789.dkr.ecr.ap-south-1.amazonaws.com/node-test:$TAG
#removing docker image from system
docker rmi -f 123456789.dkr.ecr.ap-south-1.amazonaws.com/node-test:$TAG
#removing the intermediate build image
docker rmi -f $(docker images --filter "dangling=true" -q --no-trunc)
