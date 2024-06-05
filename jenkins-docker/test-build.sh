#!/bin/bash

docker rm -f jenkins-test
docker rmi jenkins:test

docker build -t jenkins:test .

docker run -d --name jenkins-test -p 8081:8080 jenkins:test
sleep 10s
docker logs jenkins-test
