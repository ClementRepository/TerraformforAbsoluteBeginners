# Creating an EKS Cluster Using Terraform
## What is this?
Kubernetes is a platform that can deploy applications and automate changes. Docker, on the other hand, is a software platform that allows developers to build, test, and deploy applications quickly by packaging them into containers.

For the goal of this project, we will cover installation of both, and cover how to use Docker in another project folder.

## Objective
Using Terraform, you will learn how to operate with an EKS cluster and use tools within Kubernetes to manage said cluster.



## Links
[Anton Putra AWS EKS Tutorial](https://www.youtube.com/playlist?list=PLiMWaCMwGJXnKY6XmeifEpjIfkWRo9v2l)

[What is Docker?](https://www.geeksforgeeks.org/introduction-to-docker/)
## Vocabulary

## Commands


## Docker Set Up
In order to use Kubernetes, you'll need Docker installed on your local computer. The files in this folder will set up both the Docker app, as well as Docker-Compose. 

1. Make sure you have the Docker_install.sh on your local computer.
2. ```chmod +x Docker_install.sh```
3. ```./Docker_install.sh``` which should give you an output of your docker version, as well as saying "Hello from Docker!"
4. ```sudo groupadd docker``` (if the group is already there, it should give an output of "group 'docker' already exists.)
5. ```sudo usermod -aG docker``` (with your username after docker with a space) will allow you as a non-root user to access docker.
6. ```newgrp docker``` adds a new group.
7.```exit``` to get out, then ```sudo systemctl enable docker.service```
8.```sudo systemctl enable containerd.service```
9.```sudo systemctl status docker.service``` checks to see if docker is running.

_Note: You can try running Docker_enable.sh that's attached in this folder instead of using steps 7-9, as it will also give an output of whether docker is running._

## Installing Kubernetes and Tools
1.
