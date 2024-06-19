#!/bin/bash

docker rm -f sonarqube 

docker run -d --name sonarqube \
 --restart always \
 --dns 172.16.0.200 \
 -p 9000:9000 \
 -v sonarqube_data:/opt/sonarqube/data \
 quay.io/uvelyster/sonarqube
