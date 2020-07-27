#!/bin/bash

set -xe
pwd

#creating tag
COMMIT_ID=$(git rev-parse --short $GIT_COMMIT)
TAG=QA-$COMMIT_ID-$BUILD_NUMBER
echo $TAG

#edit image tag in kubernetes manifest
sed -i "s/node-test:COMMIT_ID/node-test:"$TAG"/" buildScripts/deployment.yml
#apply changes to kubernetes
kubectl apply -f buildScripts/deployment.yml
