# Kubernetes EKS Cluster using AWS and Terraform

## What is this?
Kubernetes is a platform that can deploy applications and automate changes. Docker, on the other hand, is a software platform that allows developers to build, test, and deploy applications quickly by packaging them into containers.

For the goal of this project, we will cover installation of EKS and its application

## Objective
Using Terraform, you will learn how to start up and interact with an EKS cluster and Kubernetes commands to run nginx on a pod, check contents of pods, and use various files.


## Links
[Anton Putra AWS EKS Tutorial Playlist](https://www.youtube.com/playlist?list=PLiMWaCMwGJXnKY6XmeifEpjIfkWRo9v2l)

[Kubectl Commands](https://kubernetes.io/docs/reference/kubectl/)

[IAM roles AWS](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html)

[Kubernetes Cluster AWS](https://aws.amazon.com/what-is/kubernetes-cluster/)

[Anton Putra Kubernetes Basics](https://www.youtube.com/watch?v=B_X4l4HSgtc)

[TechwithNana Pods and Containers](https://www.youtube.com/watch?v=5cNrTU6o3Fw)

## Vocabulary

Policy:  defines the permissions granted to resources within AWS.

Endpoint: A device that connects to a network and exchanges information with other devices.

IAM Role: Can be taken on by anyone who has this role, as opposed to an IAM user where it's just one person.

Node Group: a collection of nodes/instances that share the same configuration and run containers concurrently.

YAML file: A common file type that generally creates configuration files, meant to encourage ease of use for human reading.

RBAC: Role based Access Control-this manages user access to systems and protects sensitive data.

Deployment: A Kubernetes tool that manages a set of pods to run applications smoothly.

Pod: The smallest possible computing resource, in this case, meant to be managed by Kubernetes, meant to run applications.

Service: Defines a set of pods and sets configuration and mapping of network traffic between pods.

Namespace: isolates groups of resources within a cluster.

DNS-Domain Name System, names used on the internet get resolved to an IP address (For example www.namewhateveryouwant.com will show an IP address.)

Load balancer: A tool or device that distributes network traffic across a group of resources to improve the efficiency of processing tasks.

Elastic IP: EIP, which holds an IP address until released (for example, by terminating an instance.) It is static and doesn't change, which is good if you SSH into an instance often.

VPC CNI: A plugin for Kubernetes to use that allows for EC2 nodes within a cluster to have things such as public IP addresses, and attaches a private IP address as well.

Amazon ECR: Docker container registry that is meant to store and share images.

Cluster Autoscaler: Adjusts the number of nodes in the cluster if pods somehow fail.

## Commands

```kubectl version```: checks version of kubectl

```kubectl get svc```: checks status of Kubernetes services within the cluster

```kubectl get nodes -A -o wide```: Shows what nodes are present on the cluster

```kubectl get pods -A -o wide```: Shows what pods are present on the cluster

```kubectl get deployments -A -o wide```: Shows present deployments on the cluster

```kubectl get namespaces -A -o wide```: Shows present namespaces on a cluster

```aws eks update-kubeconfig --region us-east-2 --name {name of cluster}```: Sets up Kubernetes configuration of the cluster and region with AWS EKS. (change the region, and add the name of the cluster without curly brackets.)

```kubectl describe pods -A```: Shows more detailed version of pods (you can change pods to nodes, deployments, etc.)

```kubectl apply -f {name of yaml file}```: applies the functions listed within the yaml file (again, add in the name of the yaml file without curly brackets.)

```kubectl exec --stdin --tty {podname} -- /bin/bash```: Allows you to open up the terminal within a pod so that you can run commands in there. (Make sure you replace the brackets and podname with just the name of the pod.)


## Explanation of Terraform Files
_VPCs must have two subnets that are in different availability zones(minimum 2 zones). Hence, the subnet (5) file has 2 public and 2 private subnets to work._

There are 9 provided Terraform files in this project,  a YAML file that includes the RBAC needed for access, and three nginx YAML files. These Terraform files are numbered for your convenience. It is recommended to have Github open to these files while looking at VSCode for this Markdown file and Alt Tab to read these descriptions and the code in each file.

### File 1: Locals
The locals file will be references throughout the different terraform files. It is important to declare each item within this resource carefully. 
Env means the environment-in this case, we call it as "staging", i.e. prior to production.
The region is the same as usual with two availability zones declared.
eks_name is essentially a tag for the EKS.tf file to reference later on.
eks_version can be checked by running ```kubectl version```.

### File 2: Providers
The only thing to note besides what we've discussed in previous projects is the region, in which "local.region" is referencing locals.tf, in which the region was noted as us-east-2.

### File 3: VPC
Enabling DNS Support and hostnames as true allows you to run add-ons later on. Note the tags this time that references what was inside the locals.tf and env section.

### File 4: Internet Gateway/IGW
Much like before, the Internet Gateway references the vpc id in File 3. Other than that, nothing outside the scope of what we've done in the past.

### File 5: Subnets
There are 2 private and 2 public subnets here. Note the differences between the CIDR Blocks, as each one would need to have these slight differences to not clash with one another. The availability zones reference the locals file for zones. The tags contain something about "internal elb". The name has slight differences for each to not clash. This means that each of these subnets use an internal load balancer to share the load/tasks, hence the "1".

### File 6: NAT Gateway
The allocation id allocates a public ip. The NAT gateway should have a subnet id that points to a public subnet. The final "depends on" part requires the internet gateway to be ready prior to the NAT Gateway starting.

## File 7: Routes
The route tables in question are set as public and private, with private associating with the NAT gateway while the public going with the IGW. The private route tables associate with their respective private subnets and public ones with their public subnets. Note the tags will differentiate whether something is public or private.

## File 8: EKS
The first section about AWS IAM Role allows the IAM user to take on policies, or rulesets that give permissions to that IAM user for the cluster. In this particular case, EKS service (service: EKS.amazon.com) uses the IAM role. Under the iam role policy attachment, you'll see that there's a policy ARN named "AmazonEKSClusterPolicy", which allows access and allowing a user to make changes to EC2 instances within the cluster. It needs an IAM role set up prior to working (which we have above it in the file.)

[AWS EKS Cluster Policy](https://docs.aws.amazon.com/aws-managed-policy/latest/reference/AmazonEKSClusterPolicy.html#AmazonEKSClusterPolicy-json)

Under the iam role policy attachment, is the eks cluster section. It has the role attached, and the version of Kubernetes referencing what was in the locals file.

Within the VPC Configuration, The endpoint has public access set to true, but the nodes/instances within the cluster would still be in the private subnets set before without public IPs.

For access config, there is an API (a set of rules that dictate how software communicates and sends data to one another). This API in particular can add more users to access the cluster.

The boostrap section gives administrator privileges to the user that created this cluster(in this case, your IAM user). Basically, the access configuration of the user also applies/attaches to the cluster, hence the term bootstrap. This access configuration requires the IAM role policy being attached to said user.

## File 9: Nodes
The IAM role of the nodes have three policies. These are node policies that describe what and how nodes/instances behave within the cluster.

[AWS EKS Worker Node Policy](https://docs.aws.amazon.com/aws-managed-policy/latest/reference/AmazonEKSWorkerNodePolicy.html)

[AWS EKS CNI Policy](https://docs.aws.amazon.com/aws-managed-policy/latest/reference/AmazonEKS_CNI_Policy.html)

[EC2 Container Registry Read Only Policy](https://docs.aws.amazon.com/aws-managed-policy/latest/reference/AmazonEKS_CNI_Policy.html)

The worker node policy allows the nodes to connect to EKS clusters, anything from being able to describe instances to subnets.

The CNI policy allows the IP address configurations to be changed by the VPC.

The EC2 Container Registry gives read access to the EC2 Container Registry.

Underneath all this is the eks node group resource, where it references the cluster it is attached to, the subnets it uses, and the IAM roles it is associated with for the nodes. Notice that the node group includes an instance type of t3.medium, which allows for more pods to be run, and the designation of "on demand." This is in contrast to "spot" designation, where AWS has the ability to interrupt or stop that instance at any time.

In the scaled configuration section (cluster autoscaler), it has a desired size of 1 and a max of 4-referring to the load of pods it can keep up with, where the autoscaler sets up automatically.

The depends on section once again makes sure that the roles policies are all set up properly in order to move forward.

Terraform doesn't work properly if the life cycle section isn't set to ignore the scaling configuration. As such, setting it to ignore is the best practice to use.

## Steps to Start up the EKS Cluster and Configuration
1. ```terraform init``` within the correct local repository. In this case, ```cd '12-Project 12 Kubernetes EKS Cluster``` first before performing ```terraform init```.
2. ```terraform fmt``` to check syntax
3. ```terraform plan``` to double check what is to be created.
4. ```terraform apply``` to apply the changes. This might take 10-20 minutes.
5. After it says it is complete, go to the AWS console type in the search bar for "EKS" and click.
6. You should be able to see the cluster, with node information present as well.

## Steps to Use Kubernetes to View Resources.
Now that the cluster is up and running, now is the time to use various Kubernetes commands to see the intricacies present.

1. Run this command to register the EKS cluster with Kubernetes. ```aws eks update-kubeconfig --region us-east-2 --name staging-demo```. You can replace the region and name to whatever values you changed them to.
2. You can find the configuration file inside the .kube directory. ```cd ~``` then ```cd .kube``` and ```cat config```.
3.  Run ```kubectl get svc``` to check the service if it works. It will have an input of name, type, cluster ip, port, and how long it's started.
4. To view the nodes in your cluster, run ```kubectl get nodes -A -o wide``` to view it in wide view with all items in every namespace.

![alt text](<kubectl get nodes.png>)

5. If you want to see the pods present, run ```kubectl get pods -A -o wide```. This will show all the pods present.

![alt text](<kubectl get pods -A -o wide.png>)

Note that the pods shown here are in the namespace of kube-system. If you were to do anything else in changing items, it would go within the "default" name space instead. CoreDNS and Kube proxy are automatic, and the aws-node listed here was our t3.medium from before in the nodes.tf file.

6. You can run ```kubectl describe pods``` or any other thing such as nodes, to display detailed information about that resource.

## Steps to deploy Nginx
There are different ways to have Kubernetes start Nginx. Starting a pod is the smallest computer resource to deploy Nginx. A pod is the tiniest group of containers (one or more containers.)

A service, on the other hand, is a file that can group pods into a single resource and give them an IP address of their own. Services have stable port usage and IP addresses. They route traffic to the pods as an internal load balancer. It also can enable communication between pods and can access various pods' abilities.

Deployments manage pods, giving information about them, such as what AMI/image they use, what resources they use, among other things. It has a supportive role that can maintain updates and perform upkeep on pods.

### Pod
For the first example, nginx-pod.yml, It specifies "kind" as pod. Kind can be designated as a pod, service, deployment, and so forth. It specifies the pod name, what image it uses, and what port is open for it to function.

![alt text](<nginx pod example.jpg>)

1. ```kubectl apply -f nginx-pod.yaml```
2. Check the status of the pod by running ```kubectl get pods -A -o wide``` to verify that it is running.
3. You can even SSH into it by running ```kubectl exec --stdin --tty {podname} -- /bin/bash``` (Make sure you replace the brackets and podname with just the name of the pod for it to work.). ```exit``` to leave.

### Service

For the nginx service, it generally has similar syntax.

1. ```kubectl apply -f nginx-service.yaml```
2. Check the status with ```kubectl get svc -A -o wide```.

![alt text](<nginx service example.jpg>)

### Deployment

For nginx deployment, the biggest difference would be that there is a section for replicas. It would make 3 copies of nginx infused pods.

1. ```kubectl apply -f nginx-deployment.yaml``` (You can also add 2 more replicas by ```kubectl scale -f nginx-deployment.yaml --replicas=2```.)
2. Check the status by doing ```kubectl get deployments -A -o wide```.
3. Delete the deployment by using ```kubectl delete deployment {deploymentname} -n {namespace}```. Remember to fill in the deployment name and namespace without the brackets for this to work.

![alt text](<nginx deployment example.jpg>)