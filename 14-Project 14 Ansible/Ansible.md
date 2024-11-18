# Ansible
## What is this?
Ansible is a software resource that can can expedite automation, with tasks such as provisioning instances, configuration and its management, deploying different applications. All of this allows for simplification of more arduous manual tasks, and increases efficiency, making Ansible a useful infrastructure tool. Ansible also uses YAML files.

Using one computer (control node), you would be able to enable automation on multiple other servers.

For example, if we were to try to start up multiple Ec2 instances, you could start each one at a time. However, Ansible would be able to help start them all at once and manage them. _Terraform is another tool that can instantly be able to start these resources up._

## Objective
You will learn about the different aspects of Ansible's tools, and be able to create your own inventory and playbook after installing all the necessary prerequisites.


## Links
[What is Ansible](https://www.youtube.com/watch?v=1id6ERvfozo&t=517s)

[Network Chuck Ansible](https://youtu.be/5hycyr-8EKs?si=JIFlBxEUFkX1Tb1l)

[Learn Linux TV Ansible](https://www.youtube.com/playlist?list=PLT98CRl2KxKEUHie1m24-wkyHpEsa4Y70)

## Vocabulary

Control Node: The computer that has Ansible installed and sends out commands to other hosts/managed nodes.

Managed node: A computer or instance that Ansible would be managing (from the control node.)

Host: Ansible-managed remote machine (like a virtual machine or computer).

Group: Hosts that are grouped together according to one shared quality.

Inventory/hosts file: All the hosts and groups that are managed by Ansible, put toegher. This is more of a file that lists the previously mentioned items. It can either be in YAML format, or as INI.

INI: a plain text file used for configuration purposes. For the sake of this project folder, we have a hosts.ini file.

Module: scripts that Ansible runs remotely, which complete one task, such as installing an Nginx server. Modules are reusable in all aspects and include arguments to be interpreted.

Playbook: An instructional list of tasks for Ansible to use to configure and set up a system.

Python: A programming language that is free and used to build websites, automate tasks, and writing scripts and code.

## Commands

```ansible all -i inventory -m ping```: Replace inventory with the name of your hosts/inventory file. This command checks to see if you're connected to the Ec2 instance (from your computer) that you declare within your hosts/inventory file.

```ansible-playbook -i inventory playbook.yaml```: This command runs the playbook within the directory, while referencing the host/inventory file in there as well.Replace the inventory, same as the above command, and change playbook.yaml to the name of your playbook that you're using. 

## Installing Ansible
To install Ansible, first navigate to their installation guide through this link:

[Ansible Installation Guide](https://docs.ansible.com/ansible/latest/installation_guide/index.html)

Run the commands:
1. ```sudo apt update```
2. ```sudo apt install software-properties-common``` (This installs the required packages of python for Ansible to work.)
3. ```sudo add-apt-repository --yes --update ppa:ansible/ansible```
4. ```sudo apt install ansible``` (or ```sudo apt install -y ansible``` for auto-choosing yes.)

## Hosts/inventory file
At its core, Ansible would need several files created by a user to operate: the hosts or inventory file, and the playbook file. The inventory file usually is meant for grouping nodes together, say if you wanted one group of nodes or instances together, you have one group running as servers, and maybe another group as databases.

![alt text](<Ansible hosts ini.jpg>)

In this particular example (with INI format), we have two yellow bracketed heading blocks. The first one, ec2_instances, refers to the group name. Underneath the brackets is a particular list of nodes, or hosts. In this example, the ansible_host equates to the IP address of an EC2 instance that has been started. Bear in mind, explicitly typing out ansible_host isn't necessary. What is required is at least the IP address.

The second yellow bracket section dictates variables that the user can input. The ansible user is ubuntu (the operating system of the EC2 instance that was started up.) In addition, having the ssh_private_key_file parameter allows for ansible to replicate the private key path on your local computer.

_Note that "example" in that path is a placeholder for your username._

## Playbook file
The playbook file involves several declarative sections. In the below example, a playbook in the YAML format starts with the three dashes.

A playbook runs plays within the file in order. It defines what managed nodes or hosts are affected. For this example, the first part of the playbook refers to the ec2_instances hosts from the earlier inventory/hosts file.

Become, on the other hand, is a designation that then runs commands with "sudo." If the line had "become_user", then it could specify what user would run the commands instead.

Tasks then show what jobs need to be completed. The name section is declaring what the task does-update apt using ```sudo apt update```, thanks to the "become: yes" section prior. It involves apt, with the "yes" parameter of updating the cache of applications.

The next one involves installing Nginx at its present state, while the last section covers the use of systemd (similar to ```sudo systemctl enable nginx```, a command we've learned before.) It checks to see if nginx is enabled (yes), and is in a started state.

![alt text](<Ansible Playbook example.jpg>)

