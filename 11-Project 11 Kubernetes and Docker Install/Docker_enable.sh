#!/bin/bash

ls -l

docker run hello-world

sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo systemctl status docker.service