#!/bin/bash

curl https://get.docker.com | sh

systemctl start docker 
systemctl enable docker
docker run --rm hello-world
