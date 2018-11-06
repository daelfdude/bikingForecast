#!/bin/bash

sudo snap install docker 
sleep 15
sudo /snap/bin/docker load -i micronaut-hello-world.tar
sudo /snap/bin/docker run -d -p 80:8080 micronaut-hello-world 
