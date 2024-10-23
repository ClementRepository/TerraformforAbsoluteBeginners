# Docker Fun
## What is this?
As mentioned before, Docker is an application that runs containers, i.e. small resource environments that emulate virtual machine capabilities. It is considered lightweight and easy to deploy items. It runs images that contain operating systems, applications, and other resources.


## Objective
We will be able to pull images for use within docker, run appropriate docker commands, and create appropriate instructional files for Docker to use.

The project assumes you have already tried to spin up EC2 instances in the past, and have installed Docker before. If not, the section titled "Docker Set Up" will walk you through it.

## Links
[Techno Tim Docker Tutorial](https://www.youtube.com/watch?v=SnSH8Ht3MIc)

[What is Docker?](https://www.geeksforgeeks.org/introduction-to-docker/)

[NetworkChuck Docker](https://www.youtube.com/watch?v=eGz9DS-aIeY&t=255s)

[Tutorialspoint Docker](https://www.tutorialspoint.com/docker/index.htm)

[DockerHub Repository Site](https://hub.docker.com/)

## Vocabulary

Dockerfile: a file within Docker that a user creates, which defines the image and other specifications that Docker needs to run instructions.

Docker Image: a package of sorts that has all the parts needed to run a piece of software.

Docker-Compose: A plug in component of Docker, this resource allows for YAML files to configure the actions that Docker can undertake within its containers.

Docker Hub: A repository of Docker Images that users can contribute to by pushing to, or pull from. See the links section to take a look.

Apache: Similar to Nginx, Apache is an open source web server.

## Commands

```docker ps``` shows what is running. ```docker compose ps``` is the same, but for resources from compose yaml files.

```docker pull```: pulls images from DockerHub for your usage. Pulls the latest version from Docker Hub.

```docker images```: shows what images have been installed with appropriate information. ```docker image rm``` followed by image name would remove the image.

```docker run```: starts up the container (see Docker pulling images and creating images).

```docker stop```: stops container. (followed by container name) or ```docker stop $(docker ps -a -q)``` to stop all.

```docker rm```: removes container. (followed by container name)

```docker restart```: restarts container. (followed by container name)

```docker pause```: pauses container. (followed by container name)

```docker unpause```: unpauses container. (followed by container name)

```docker build```: Builds a custom image based off your dockerfile in the directory. Followed by the name you want your image to have.

```docker ps -aq | xargs docker stop | xargs docker rm```: stops, removes and deletes/kills off all containers (if dockerfile)

```docker compose up -d```: Docker compose command to start up/run the docker-compose.yml instruction file.

```docker compose down -v```: Docker compose command to stop and remove the created container.

```docker logs --details```: To check logs of Docker interactions.

## Docker Set Up
 The files in this folder will set up both the Docker application, as well as Docker-Compose plugin (add-on). Launch an EC2 instance first, and SSH into it.

1. Create the Docker_install.sh file within your EC2 instance.
2. ```chmod +x Docker_install.sh```
3. ```./Docker_install.sh``` which should give you an output of your docker version, as well as saying "Hello from Docker!"
4. ```sudo groupadd docker``` (if the group is already there, it should give an output of "group 'docker' already exists.)
5. ```sudo usermod -aG docker``` (with your username after docker with a space) will allow you as a non-root user to access docker. For example, on an Ubuntu EC2 instance, ```sudo usermod -aG docker ubuntu```
6. ```newgrp docker``` adds a new group. ```exit``` after.

7. ```sudo systemctl enable docker.service```
8. ```sudo systemctl enable containerd.service```
9. ```sudo systemctl status docker.service``` checks to see if docker is running.

## Docker Pulling Images and Starting/Stopping Containers using Commands
_Please make sure the Docker Set Up section is completed prior to this In addition, in your security group, open up port 8080 for this to run. Go to EC2, Security groups, then to whatever group you have with your active ec2, and then edit inbound rules._
0
In this section, we will pull the nginx image from the Docker Hub repository and start a container.

1. Launch an EC2 instance on AWS, and ssh into it.
2. Go to [DockerHub Repository Site](https://hub.docker.com/). Click signup and set up your account.
3. You can use the docker search bar to find nginx. On the right, it will show the command needed to pull the image. This syntax is ```docker pull``` followed by the resource name.
4. ```docker pull nginx``` to pull the image to your virtual machine.
5. ```docker images``` to see what images are present.
6. ```docker run -it -d -p 8080:80 --name web nginx``` is a command to run the nginx image.

To clarify some of these flags,

-it: short for --interactive and -tty. Goes straight into the container.

-d: detached mode, allows the container to run in the background.

-p: allows for input of ports (in this case, the host port of 8080 is "mapped" to port 80 of the container, allowing for web access.)

-web: name of our container (you can change it, if you'd like.)

-nginx: image being used.

7. To see if your security group configuration works, type your EC2 IP address in a browser, followed by the colon and port number (:8080). It should bring up an Nginx default page. For example, if the IP of the EC2 is 1.1.1.1, then it would be 1.1.1.1:8080.
8. It is possible to "SSH" into the container as well. ```docker exec -it web /bin/bash```. This will allow terminal access within the container. Replace "web" with whatever the anme of your container is. Run```exit``` to leave.
9. ```docker stop web``` will stop the container.

## Docker Building Images
Building a Docker image can be done by using a Dockerfile, which is essentially an instruction manual for Docker to follow. You can also use a Docker Compose YAML file that would serve the same purpose. For our example, we will go over both, with example files to match.

### Building an Nginx image using Dockerfile
1. Within a directory you want to use, ```touch dockerfile```. 
2. ```nano dockerfile``` to get into it.
3. Copy and paste the contents of nginx-dockerfile from this project folder into the file. Save and exit.

![alt text](<Nginx dockerfile example.jpg>)

We will go over some components of a Dockerfile here.

FROM tells us what image is to be used.

RUN will run a command on top of the image, usually to install and set up.

WORKDIR sets the working directory that the Dockerfile will start work in.

ENV sets environment variables.

COPY copies the contents of the first file into the destination listed second.

EXPOSE tells what port to be open/exposed.

CMD is the command that will be followed when the container starts. Only one command can be followed per Dockerfile.

For the example, it pulls the Nginx image (the latest and updated version), copies the contents of index.html (its configuration for the webpage, and puts it within the second path.) It exposes port 8080, and will start a command of running Nginx in the foreground with a "global" configuration.


4. Make an index.html file for Nginx to use. ```touch index.html```.
5. Copy and paste the contents of index.html from this project folder into the file within your EC2. Save and exit.
6. Run ```docker build -t nginx_image .``` to create the Docker image. You can name it something else than nginx_image.
7. Run ```docker images``` to check if it was made.
8. Run ```docker rmi``` followed by image id will remove the image.

### Building an Nginx image using Docker Compose
1. Follow step 4 and 5 of the previous section.
2. ```touch docker-compose.yml``` to make a docker compose file. Keep in mind that it needs to be spelled out as such.
3. ```nano docker-compose.yml```. The example docker-compose-nginx.yml file within this project folder has the configuration for you to copy and paste into your own.

![alt text](<Nginx docker compose file example.jpg>)

The components of Docker Compose YAML files may include:

Version: What format this file has so that it can interact with other features.

Services: lists all containers that comprise the application.
In the services section, it includes the image, the name you want the container to have, what ports to map to, and in this example, the configuration of restarting.

Networks: Shows configuration and communication purposes in between containers.

Volumes: The storage capabilities shared between services.

For more detailed reading, click the link below.

[Tutorialspoint Docker Compose YAML](https://www.tutorialspoint.com/docker/docker_compose.htm)

4. Now that you have the index and docker compose files, ```docker compose up -d``` to start. It will look as follows:

![alt text](<Nginx docker compose.jpg>)


5. ```docker ps -a``` to see the container that was created.
6. ```docker compose down -v``` will stop the container and remove it.

## Pushing Images to ECR
You will be creating a repository connected to AWS through your terminal. Make sure you install the AWS CLI into your EC2 Instance. For reference, the install steps from project 9 have been placed below.

### AWS CLI Install
1. Open up your terminal and go to your home directory. ```cd ~```

2. ```curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"```

3. ```sudo apt install unzip```

4. ```unzip awscliv2.zip```

5. ```sudo ./aws/install``` (It will tell you that you can run ```/usr/local/bin/aws```)

6. ```aws --version``` and it will show you what version of the AWS CLI is installed.

7. ```aws configure``` to put in your access key, secret access key, region, and then you should be able to do the following section.

### Steps to Push Images to ECR

The easiest way to push images is starting off with the AWS console.

1. Go to the AWS dashboard search bar and search "ECR" or Elastic Container Registry. Click on it.
2. Click "Create Repository." You'll need to add a name space and a repository name.
3. Check to see if it was created and click on your repository.
4. Click on "view push commands" for instructions on how to connect ECR to your Docker client.
5. Copy the first step into your terminal and run the command. The first one should end with a "login succeeded" output.
6. Since you already built your image, you have to add a tag for identifying the image. run ```docker images``` to see what image you want to tag. The tag command should follow the structure of: ```docker tag imagename:latest accountid.dkr.ecr.us-east-2.amazonaws.com/namespace/repository:latest```
(replace imagename with the name of your image, accountid with your account number, and namespace and repository name.)
7. Lastly, run ```docker push accountid.dkr.ecr.us-east-2.amazonaws.com/namespace/repositoryname:latest``` (replace accountid, namespace and repositoryname.) It should show "pushed" in different lines if it goes.
8. Refresh the AWS images page to see if it was successful.


## Exercise:




