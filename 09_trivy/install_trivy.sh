#!/bin/bash

curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh
chmod +x ./bin/trivy
cp ./bin/trivy /usr/bin/
