# Kubernetes EKS Cluster using AWS and Terraform

## What is this?
Kubernetes is a platform that can deploy applications and automate changes. Docker, on the other hand, is a software platform that allows developers to build, test, and deploy applications quickly by packaging them into containers.

For the goal of this project, we will cover installation of EKS, and cover how to use Docker in another project folder.

## Objective
Using Terraform, you will learn how to operate with an EKS cluster and use tools within Kubernetes to manage said cluster.



## Links
[Anton Putra AWS EKS Tutorial Playlist](https://www.youtube.com/playlist?list=PLiMWaCMwGJXnKY6XmeifEpjIfkWRo9v2l)


## Vocabulary

Policy

Endpoint

IAM Role

Node Group

YAML file

RBAC: Role based Access Control-this manages user access to systems and protects sensitive data.

## Commands


## Steps
_VPCs must have two subnets that are in different availability zones(minimum 2 zones). Hence, the subnet (5) file has 2 public and 2 private subnets to work._

There are 9 provided Terraform files in this project, including a YAML file that includes the RBAC needed for access.