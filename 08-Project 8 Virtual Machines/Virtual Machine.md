# Learning how to start a Virtual Machine
## What is this?
A virtual machine uses software to emulate an actual computer, in which running applications or programs can be done. Since it is software, it would take up less physical space and can be controlled from an actual computer (called the host), while borrowing some power from the host.

## Objective
Using the AWS console (control panel), you will be able to start your own Virtual Machine (EC2 Instance) and SSH into it to install and run several programs, such as Nginx. You will also learn to change Nginx files to display a message on your browser.

## Links
[Virtual Machines Explained in 15 minutes](https://www.youtube.com/watch?v=mQP0wqNT_DI)

[Network Chuck IP Address video](https://www.youtube.com/watch?v=5WfiTHiU4x8&list=PLIhvC56v63IKrRHh3gvZZBAGvsvOhwrRF&index=1)

[Powercert HTTP HTTPS](https://www.youtube.com/watch?v=hExRDVZHhig)

[Powercert Ports](https://www.youtube.com/watch?v=g2fT-g9PX9o)

[What is Amazon VPC](https://www.youtube.com/watch?v=WfCmi3vTVkY)

[AWS EC2 Documentation](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html)

[AWS CIDR](https://aws.amazon.com/what-is/cidr/)

[VPC in one minute](https://www.youtube.com/watch?v=hS_uvz4ohbo)

## Vocabulary/Commands
- Virtual Machine: An emulation or virtualization of a computer where resources can be run as software.
- EC2 Instance: Amazon's regular virtual machine
- Cloud: a network of servers that store and deliver content through the internet.
- web server: a computer system that stores and delivers content through the internet.
- AMI: Amazon Machine Image for the EC2 instance (i.e. it has a distribution, such as Ubuntu, to run its EC2.)
- Port: A meeting point that programs and services can exchange data. (An open port on your computer allows traffic in. For example, Port 443 being open allows https based websites to be accessible. Closing this would prevent you from browsing websites.)
- Security Group: This controls the traffic to and from your EC2 instance. You can open and close ports for this purpose.
- CIDR Block: An efficient way to distribute IP addresses, allowing more addresses to be used.
- IP Address: Every computer or machine connected to the internet has an address in which it uses its address and others to communicate.
- VPC: A virtual network that allows for creation of subnets, encased within a public cloud.
- Subnet: A division of a larger network that splits into smaller networks, which allows traffic to travel faster.
- HTTPS vs HTTP: Hypertext transfer protocol, in which HTTPS is the "secure" version of the other to encrypt or protect your information on websites.
- Availability Zone: When setting the AWS region, such as us-west-2, it will have multiple Availability zones that can serve as backups in case one region's instances fail.
- Nginx: A web server that is known for using less resources and being stable for applications such as websites.



## Steps to Launch an EC2 Instance
1. Login to your AWS account
2. On your home page, go to the search bar on the top and search for "EC2" and click on it.
3. Once you are on the dashboard for EC2, click "Launch Instance."

![alt text](<ec2 dashboard1.jpg>)

4. Name your instance. Find the Amazon Machine Image section and select Ubuntu, and let it choose the version, AMI ID, Architecture, etc. automatically.

![alt text](AMI.jpg)

5. Scroll down to instance type and key pair. For the sake of this project, choose T2.micro in the instance type (Which wouldn't cost you anything as long as you delete the virtual machine later) and select your key pair that you imported from Project 3.

![alt text](<instance type and key pair.jpg>)

6. Go to the Network Settings section below that and Create Security Group. Check off Allow SSH Traffic, Allow HTTPS traffic and Allow HTTP Traffic. In the box to the right, click the drop down and choose "My IP". It will show your IP Address CIDR Block. The Security group will allow Ports 22 (SSH) Port 443 (Web traffic that is encrypted in HTTPS) and 80 (unencrypted HTTP)

_Note: While "Anywhere" with the 0.0.0.0/0 CIDR Block is okay for just practice, it's better to allow just from your IP Address so no one else can access your EC2 instance._

![alt text](<Network Settings.jpg>)

7. Click "Launch Instance" on the right. It will then say "Success" and a message with a link to access the EC2. Or, you can click instances and it'll show what instances are running. Click the link for Instance ID to bring up information below it for the next section.

![alt text](<instance info.jpg>)

## Steps to Connect to the EC2 Instance

1. From Step 7 of the previous section, you should have a "details" tab, along with other tabs that compile information about your now running Ec2 instance.
2. Click the "Security" Tab, and click on the security group link.
3. It should just say that SSH and port 22 are what is allowed. Click "Edit Inbound Rules."
4. Once you click that, click "Add rule" to then choose "Custom TCP." In the "Port" box, type 443.
5. Do the same again, but type 80 in the Port box.

![alt text](<inbound rules1.jpg>)

6. In the "Source" box, choose 0.0.0.0/0 (Which allows all traffic)

_Note: for practice, 0.0.0.0/0 is ok, but for security in actual work-related situations, choose your own IP option in the drop down._

7. Go back to your Ec2 dashboard, click "Instances", click your EC2 instance, and find the details tab. Copy the IPv4 address listed there.
8. In your terminal, run the command ```ssh ubuntu@``` followed by the IPv4 address you copied from the details tab, then press enter. It will ask you if you want to allow it. Type yes and enter.

![alt text](<ssh into ec2.jpg>)

9. If it looks like the picture above, then you are inside your EC2 instance! Nice job! Now you can install things in here and work with it.

10. If you want to get out of the EC2 instance, type ```logout``` and enter. It will close your connection.
11. If you want to delete the instance, go back to where you found the details of your instance, and there should be a "Instance State" that will drop down, with a "terminate instance" option.

## Nginx Website Fun

### What is Nginx?
Nginx is a web server that can handle many different connections. From your terminal, you can manipulate the files to change its appearance on your browser.

## Steps to install Nginx and Change files
1. Make sure you are in your EC2 instance from the previous section.
2. ```sudo apt install``` nginx.
3. After the install is complete, you can start nginx by running ```sudo systemctl enable nginx```, then ```sudo systemctl start nginx```, and check if it's running using ```sudo systemctl status nginx```.

![alt text](<nginx status.jpg>)

4. ```curl localhost``` in your terminal to see if you get an output from Nginx. It should say "Welcome to Nginx".
5. Go to your web browser and type in the IPv4 address of your EC2. It should display the same as step 4.
6. To change the output from Nginx, you need to first find the appropriate file. ```cd /var/www/html``` to find the contents. 
7. ```sudo nano index.nginx-debian.html``` and configure it yourself to say what you want it to say.
8. Test it again by doing step 5 over, with after you've changed html file from Step 7. See the picture below.

![alt text](<Changed Nginx text .jpg>)

## Exercise:
- Delete the instance. Launch another instance with permissions for allowing port 22, 80 and 443 in the security group. SSH into the instance. Create a bash script that will:
- install nginx
- enable nginx
- start nginx
- check nginx's status
- stop nginx
- remove nginx from your instance

_Note: See nginx_install.sh afterwards to see an example of the bash script._