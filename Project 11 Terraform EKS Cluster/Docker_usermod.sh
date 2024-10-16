#!/bin/bash

#if docker group doesn't exist do sudo groupadd docker
#if this script doesn't run make sure you do chmod +x Docker_usermod.sh

ls -l
sudo groupadd docker
sudo usermod -aG docker ubuntu
newgrp docker
docker run hello-world
exit
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo systemctl status docker.service