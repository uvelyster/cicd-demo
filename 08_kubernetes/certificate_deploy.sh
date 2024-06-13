#!/bin/bash

scp -r /etc/docker/certs.d controlplane:/etc/containerd/
scp -r /etc/docker/certs.d node01:/etc/containerd/
scp -r /etc/docker/certs.d node02:/etc/containerd/
