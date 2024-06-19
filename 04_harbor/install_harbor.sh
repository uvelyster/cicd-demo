#!/bin/bash

cp -r /auth /data
dnf install -y wget
wget https://github.com/goharbor/harbor/releases/download/v2.10.0/harbor-offline-installer-v2.10.0.tgz
tar xzvf harbor-offline-installer-v2.10.0.tgz
cp harbor.yml harbor/
cd harbor/
./install.sh  --with-trivy
