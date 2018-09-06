#!/bin/bash -v
apt-get update -y
apt-get install -y nginx > /tmp/nginx.log
apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
apt-get update -y
apt-cache policy docker-ce
apt-get install -y docker-ce > /tmp/docker-ce.log
