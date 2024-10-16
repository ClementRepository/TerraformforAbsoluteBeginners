# Install and Set up AWS CLI and Terraform
## What is this?
Terraform is an example of "Infrastructure as Code" software that allows users to set a blueprint for their work and be re-configured across different sources to be re-used. (Basically, allowing you to set up everything once and not need to create everything manually again.)

The AWS CLI is Amazon's application that allows the user to configure and manage their AWS resources within their own local terminal.

## Objective
You will be able to install and configure both AWS CLI and Terraform. 

## Links
[What is Terraform](https://developer.hashicorp.com/terraform/intro)

[Spacelift Terraform Explanation](https://spacelift.io/blog/what-is-terraform)

[Infrastructure as Code](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/infrastructure-as-code)

[Terraform Explained in 15 minutes](https://www.youtube.com/watch?v=l5k1ai_GBDE)

## Vocabulary 
HCL: Hashicorp Configuration Language. This language is used by Terraform and is considered human readable and can deploy cloud resources when configured. Hashicorp is the company behind Terraform.

IaC: Infrastructure as Code which allows users to set up their work environment without needing to change everything over and over. This vastly speeds up the process by re-using the same configuration.

AWS CLI: Amazon's Command Line Interface that will allow a user to change files and set up a connection to the AWS console.

Root User: The original owner of the account/computer. You should not allow root access to others on your accounts.

IAM User: A separate account identity that allows someone access to AWS resources.

GPG Key: A tool that uses public keys to verify a file's origin or authenticity. (Used within the bash script example, as the ```gpg``` command.)

## Commands

```aws configure```: Allows someone to configure a user in the terminal for usage of AWS resources.

```aws sts get-caller-identity```: shows you your AWS identity after you've configured the CLI. See the section on CLI Configuration and Set Up.

```curl```: requests data and transfers it using URL/web addresses.

```wget```: retrieves data from the internet and downloads accordingly.

```|```: called a pipe, takes the standard output of one process and passes it as standard input into another process. For example, ```ls | grep read.txt``` means it lists everything, and then finds the file ```read.txt```. The structure of this is usually command1 | command2.

## AWS CLI Install
1. Open up your terminal and go to your home directory. ```cd ~```

2. ```curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"```

3. ```sudo apt install unzip```

4. ```unzip awscliv2.zip```

5. ```sudo ./aws/install``` (It will tell you that you can run ```/usr/local/bin/aws```)

6. ```aws --version``` and it will show you what version of the AWS CLI is installed. See below for the example output.

![alt text](<aws version after cli install.jpg>)

## AWS CLI Configuration and Set Up
1. Login to your AWS Dashboard on your browser.
2. Search for IAM in the search bar and click on the first result to go to the IAM dashboard.
3. From there, find "Users" on the left and click that.
4. Click "Create Users".
5. Create your user for IAM and password. (Check the box that provides user access to the Console so you can see it from the IAM view.)
6. You can add policies or permissions to the IAM user if you'd like. Go back to "Users".
7. Click on the newly created user under "user name".
8. Find the button that says "Create Access Key".
9. Choose "Command Line Interface" as the use case, click next. (What you're using it for)
10. Choose a tag and then create the key.
11. You will be able to view the Access Key and Secret Access Key. _**Make sure you copy them down somewhere, like a text document, for the next step. You will not be able to see the Secret Access Key again.**_
12. Go to your terminal and run the command ```aws configure```. It will ask you for the Access Key, Secret Access Key, Default Region, and Default output format. (You can leave the output format blank, but you can put the region as whatever region you use in AWS.)  
[AWS Configure Steps](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-quickstart.html)

## How to check your AWS CLI Credentials in your Terminal
1. ```cd .aws```
2. ```sudo nano credentials``` (You will see your access key and secret access key)

OR

run the command ```aws sts get-caller-identity``` (You will see if the ARN includes the user at the end of the line)

## Terraform Install and Set Up
1. You can either copy and paste the code from Install_Terraform.sh and create your own bash script, or if you already have put the repository into a local folder: ```git clone git@github.com:Clemchowdah/TerraformforAbsoluteBeginners.git```, you already have this file in your local computer.
2. ```chmod +x Install_Terraform.sh```
3. ```./Install_Terraform.sh```
4. ```terraform --version```
