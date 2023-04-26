#!/bin/bash

# Enable Remote API
#sed -i 's/fd:\/\/ /fd:\/\/ -H tcp:\/\/0.0.0.0:4243 /g' /usr/lib/systemd/system/docker.service
#systemctl daemon-reload ; systemctl restart docker

# copy docker CLI to working directory
echo 'copy docker Binary'
cp /usr/bin/docker .

echo 'build image named jenkins-docker'
docker build -t jenkins-docker .

echo 'build complete'
