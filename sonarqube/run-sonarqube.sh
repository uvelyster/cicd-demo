#!/bin/bash

docker rm -f sonarqube 

docker run -d --name sonarqube \
 --dns 172.16.0.200 \
 -p 9000:9000 \
 -v sonarqube_data:/opt/sonarqube/data \
 sonarqube:lts-community
