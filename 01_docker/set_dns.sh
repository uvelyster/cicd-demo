#!/bin/bash

cp hosts /etc/hosts
yum install -y dnsmasq
systemctl start dnsmasq
systemctl enable dnsmasq
