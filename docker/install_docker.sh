#!/bin/bash

sudo systemctl stop firewalld 
sudo systemctl disable firewalld
sudo curl -o /etc/yum.repos.d/docker-ce.repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce

sudo systemctl start docker 
sudo systemctl enable docker

# docker run --rm hello-world
