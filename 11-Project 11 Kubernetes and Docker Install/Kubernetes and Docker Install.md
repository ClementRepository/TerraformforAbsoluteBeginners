# Setting up Kubernetes
## What is this?
Kubernetes is a platform that can deploy applications and automate changes. Docker, on the other hand, is a software platform that allows developers to build, test, and deploy applications quickly by packaging them into containers.

For the goal of this project, we will cover installation of both Kubernetes and Docker, and cover how to use Docker in another project folder.

## Objective
Using Terraform, you will learn how to install both Docker and Kubernetes to begin operating with a node cluster in the next project. 


## Links
[Anton Putra AWS EKS Tutorial](https://www.youtube.com/playlist?list=PLiMWaCMwGJXnKY6XmeifEpjIfkWRo9v2l)

[What is Docker?](https://www.geeksforgeeks.org/introduction-to-docker/)

[NetworkChuck Docker](https://www.youtube.com/watch?v=eGz9DS-aIeY&t=255s)

## Vocabulary

cluster: Group of servers or resources that act together and share the load.

container: Software in a contained/isolated environment meant to run programs faster.

EKS: Elastic Kubernetes Service, the AWS feature for utilizing Kubernetes

## Commands

```kubectl```: The command line interface for Kubernetes

```eksctl```: Command line interface for EKS

```newgrp```: Adds a group for Docker

```usermod```: changes account details

## Docker Set Up
In order to use Kubernetes, you'll need Docker installed on your local computer. The files in this folder will set up both the Docker app, as well as Docker-Compose. 

1. Make sure you have the Docker_install.sh on your local computer.
2. ```chmod +x Docker_install.sh```
3. ```./Docker_install.sh``` which should give you an output of your docker version, as well as saying "Hello from Docker!"
4. ```sudo groupadd docker``` (if the group is already there, it should give an output of "group 'docker' already exists.)
5. ```sudo usermod -aG docker``` (with your username after docker with a space) will allow you as a non-root user to access docker.
6. ```newgrp docker``` adds a new group. 

7. ```sudo systemctl enable docker.service```
8. ```sudo systemctl enable containerd.service```
9. ```sudo systemctl status docker.service``` checks to see if docker is running.
10. ```sudo systemctl restart docker``` to apply changes.



## Installing Kubernetes and Tools
_The bash script file uses Kubernetes' apt repository to download the public signing key needed for the Kubernetes repository and will install all other necessary items, and then outputs the version._

You will install both the kubectl and eksctl commands.
### Kubectl
1. Open the Kubectl_install.sh bash script file and verify that it is on your local computer.
2. ```chmod +x Kubectl_install.sh```
3. ./Kubectl_install.sh
4. It should then have an output that tells you the client version of kubectl, which is 1.31.1 as of this writing.

### Eksctl
1. Open the Eksctl_install.sh file and verify that it is on your local computer.
2. ```chmod +x Eksctl_install.sh```
3. ./Eksctl_install.sh
4. The output should say something along the lines of eksctl: OK and also the version of eksctl.
