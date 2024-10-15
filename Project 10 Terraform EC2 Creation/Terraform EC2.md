# How to create an EC2 Instance Using Terraform
## What is this?
Terraform can be used to create instances using its different aspects of code. Learning about these different parts will benefit anyone who seeks to learn the intricacies of Infrastructure as Code.

The tutorial will be grouped into sections for each part of the terraform files. It is recommended to use VSCode to keep the syntax neat and formatted.

## Objective
You will be able to break down Terraform files in their respective parts and create an EC2 instance from your local terminal.

## Links
_Note: Links for Terraform documentation will be included in their appropriate tutorial sections below, rather than in this section._

## Vocabulary 
_Vocabulary will be discussed within their corresponding sections of Terraform and AWS documentation._

## Commands

```terraform init```: Starts up your terraform project.

```terraform plan```: Shows you what your terraform resources are, within your configuration file.

```terraform fmt```: Fixes formatting or syntax issues.

```terraform apply```: Applies the terraform resources in your configuration files.

```terraform show```: Shows what resources are present and applied.

```terraform destroy```: Deletes and destroys anything that terraform applied earlier.

# Prior Set Up
_**Note: Only if you didn't clone the repository already in Project 7. You should still do step 4 of this section to see the appropriate Terraform files.**_
1. Go to [TerraformForAbsoluteBeginners Github](https://github.com/Clemchowdah/TerraformforAbsoluteBeginners) and press the fork button.
2. In Vscode, open a new window and click "Clone Git Repository". In the dropdown, click "Clone from Github".
3. Choose the correct repository to clone. You'll need to right click when it asks a folder to clone into, and press "new", and rename the folder. Select that folder as the repository destination.
4. In the explorer bar on the left in VsCode, click into Project 10 Terraform EC2 Creation to access the appropriate terraform files.

## 1. Providers.tf File
The providers section and subsequent providers.tf file tells Terraform what application to communicate with. In our case, it will be AWS. You can also access the link for the AWS Provider Documentation here.

[AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

![alt text](<providers terraform file.jpg>)

On line 1-3, Terraform asks for the required provider. As we mentioned before, it would be AWS. 

On line 4, we put the source as hashicorp/aws. This is also referenced in the Provider Documentation example. Please take a look.

_Notice on lines 1, 2, and 3, there are brackets open to the right, and then enclosed by square brackets in line 5, 6, and 7. It is very important to close them, as leaving them open will give an error output later. Likewise, quotation marks are needed for any content, including those within brackets._

On line 9, we get to the provider details section. "aws" is the listed provider since we are using AWS with Terraform.

In Line 10, this is the region. If you remember from your AWS console, you chose a region to start. When you go to your AWS Dashboard, next to your name on the top right, there should be a region listed, with its appropriate region code in the drop down. In the picture, us-east-2 refers to Ohio.

For Line 11, a shared_credentials_file is asking where your AWS credentials are stored within your local computer. In this example, it's inside the .aws directory under the credentials file. (This particular section needs square brackets since it is showing the path to the file.)
The profile part of this is asking what profile is going to access AWS. Run ```aws sts get-caller-identity``` to check which profile you are on. It will be after the word "ARN", after user and a / line. 
Lastly, the final bracket on line 13 closes off what line 9 started.

### Steps for Providers.tf File
1. Open up providers.tf.
2. Change the region to the one you use, like "us-west-1".
3. For shared_credentials_files, if your AWS credentials path is different, input that.
4. For profile, put in your AWS profile name that you'll see after you run ```aws sts get-caller-identity```. It is shown after user and a / in the "ARN" line.

## 2. Datasources.tf File
The data sources file in our example shows what kind of distribution we want for our EC2 instance. You can take a look at the documentation for data sources below.

[data sources Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami)

![alt text](<data sources terraform file.jpg>)

In line 1, the data section goes over where the ami (Amazon Machine Image) comes from, and that it is designated as a server.
Line 2 tells us that the ami would be the most recent or updated version; hence the label equaling true. If it wasn't the most recent it would be noted as false.
Line 3 shows the owner of the AMI. To find the owner of an AMI, you need to go to launch instances within your EC2 Dashboard in the AWS console. It will show you the AMI ID once you have Ubuntu selected, as shown below.

![alt text](AMI.jpg)

Once you have the AMI ID copied, click "AMI" on the left toolbar. It will take you to the AMI search function. Make sure the drop down is set at "Public Images", then paste the AMI ID you have into the search bar. From there, the Owner number will be visible.

As shown in the example for owners, you'll find the owner ID to input in your datasources.tf file.

![alt text](<AMI example.jpg>)

Under line 5 onwards, the filter section can specifically identify the version of the Ubuntu. Within the picture you see above, there's a section called AMI name that you can click to find the "values" part of line 7. 

### Steps for Datasources.tf file
1. Open up datasources.tf
2. Go to your AWS Console and click Launch Instance after choosing Instance.
3. Copy the AMI ID after selecting Ubuntu.
4. Paste the AMI ID into the AMI search bar after going back and clicking AMI on the left toolbar. Don't forget to have public images set as a filter.
5. Copy the owner number and paste it into the owners section of your datasources.tf file.
6. Click on the AMI again to find the details. Copy the AMI Name information, but replace the numbers after the last dash with a * instead. This will allow the newest updated version of this AMI to be used, as you see in the example from before.

![alt text](<AMI Name.jpg>)

7. Save your datasources.tf file.

## 3. Main.tf File
The main.tf file carries the bulk of the terraform resources. Some people prefer to split up their resources into separate .tf files to make it easier to locate information. For the sake of this tutorial, the main.tf file will hold different resources, and this section will go over each resource seen in the example.

### VPC

![alt text](<vpc terraform section .jpg>)

[VPC AWS documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)

This time, in line 1, the first quotation of "aws_vpc" cannot be changed. The second set of quotations is the name of your VPC. 
The CIDR block is up to you for line 2, but the one listed in the example is in the documentation as well.

In Line 3, "default" is the default setting that makes all EC2 instances in this VPC
The tags in line 5 and 6 tell you what subgroup this is a part of. Don't forget to enclose all brackets.

#### VPC Steps
1. Open main.tf.
2. In line 1, you can rename "main" into something else. Whatever you put in here, you'll need this name for following sections.
3. For CIDR block, you can keep it the same for this project.
4. If you want to add a tag, do so on line 6.
5. Save file.

### Subnet

![alt text](<aws public subnet.jpg>)

[Subnet AWS documentation](https://docs.aws.amazon.com/vpc/latest/userguide/configure-subnets.html)

In line 10, like before, the second set of quotations can be altered to whatever you'd like to name it.

Line 11 is very important, as noted in Step 2 for VPC. For VPC_id, you'd need aws_vpc. which is followed by whatever you named your vpc, and .id last. If you named the vpc "first", for example, then vpc_id would become aws_vpc.first.id at the end. You will reuse this in most resource sections.

Now, look at the CIDR block of both the main_public_subnet and main_public_subnet_2. There's a small change in the block, from 1 and 2. One's being used so the number has to be different.

Availability zone, in lines 13 and 24, refers to what you typed in the providers.tf file for the region. You'll need an "a" or "b", or "c" to differentiate the zones. So instead of say, us-west-1, you'd have us-west-1a and us-west-1b.

Lastly, give name tags to differentiate the two subnets.

#### Subnet Steps
1. Open main.tf.
2. In the vpc.id, change the "main" to whatever you named the VPC.
3. Change availability zones to your choosing.
4. Update name tags.
5. Save file.

### Internet Gateway, Route Table, Route, Route Table Association

[Internet Gateway AWS Documentation](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Internet_Gateway.html)

[Route Table AWS Documentation](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html)

Internet Gateway: An internet gateway is a device that connects a network to the internet, allowing data to flow in and out of a private network, such as using a Wi-Fi router.

Route Table: A set of rules (routes) that dictate where data goes across an IP network.

Route Table Association: The link between a route table and a subnet, internet gateway, or virtual private gateway. When a route table is associated with a subnet or gateway, traffic from that subnet or gateway is routed based on the rules in the route table.

![alt text](IGW_RT_Route_RTA.jpg)

Much like before, the second set of quotations will be names that you'd like to use.

For the internet gateway resource example, you'd reference the vpc id again.

For route table on line 39, you'd again refer to the vpc id.

For the aws_route, you'll need to have a route table id that references the name you have for aws_route_table resource from above. Similar to how vpc_id always had aws_vpc.main.id, the route_table_id in line 48 follows aws_route_table., followed by the name for your route table, then .id as before.

In line 49, within our testing environment, we would have an open CIDR block with 0.0.0.0/0, but remember that this would change in actual production environments.

Line 50, where the gateway id is, refers to line 31, with similar syntax for what we put in the second quotations.

Lastly, in line 53, we have route table association, with a named second set of quotations. Subnet id refers to what we put in the subnet section from earlier, while the route table id would refer to what we placed for aws_route in line 47 and 48.

#### IGW, Route Table, Route, Route Table Association Steps
1. Open main.tf.
2. Change values in the second set of quotations to your liking for each section listed.
3. For eacvh vpc_id, make sure it references your VPC name from before.
4. For the aws_route, make sure your route table id refers to the correct name (from the aws_route_table resource).
5. Do the same for the gateway_id to refer to the name of your aws_internet_gateway.
6. Make sure your subnet_id in your route table association refers to the name you put for the first public subnet.
7. For the route table id, make sure it matches what you named the aws_route_table.
8. Save the file.

_Make sure everything matches so far!_

### Security Group

[AWS Security Group Documentation](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-security-groups.html)

Security Group: determines what traffic can come in to a resource such as an EC2 Instance, as well as what it can send out.

Ingress: dictates what ports are open and have traffic coming in.

Egress: Dictates what ports are open and have traffic heading out of the resource.

Protocol: A set of rules that dictate how data is transmitted across a network. In our example, we use TCP, or Transmission Control Protocol, which ensures data is properly transferred.

![alt text](<aws security group.jpg>)

For aws_security_group, it refers to the name (which you put in the second set of quotations in line 58), the description (which you can put a short description, in quotes), and again, the vpc_id that it is attached to.

For both the ingress and egress parts, you may notice that there is an indent, since they are considered part of the security group resource.

It lists ports of Ingress, where traffic can come in. In 22 (SSH), it is highly recommended to put your CIDR block to include your IP address/32 for security reasons. 

80, 443 and 3306 are open as well. You can omit any ports you feel like, or add more as need be. (3306 is for connecting to databases.)

For Egress, 0 for the ports means everything is accessible. The protocol is -1, which means all protocols are usable. 

Note that the brackets are properly closed for each section of ingress and egress.

#### Security Group Steps
1. Open main.tf
2. Change the name of the security group to your liking.
3. Change the description as needed.
4. For ingress from port 22, add in your IP address to cidr block with /32.
5. Save the file.

### AWS Key Pair

[AWS Key Pair Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair)

![alt text](<aws key pair resource.jpg>)

As usual, change the second set of quotations, to what you want. 

The key_name is up to you as well.

The public key is exactly the same as what you've done before when you imported the key pair to the AWS Console from Project 3. Make sure you have quotations!

#### Key Pair Steps
1. Open main.tf.
2. Change set of second quotations to a new name.
3. Change key_name to what you'd like.
4. Fill in public_key with your public key. Refer to project 3 on how to find your public key again in your terminal.

### AWS Instance

[AWS Instance Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)

![alt text](<Aws EC2 terraform.jpg>)

This last section tells AWS what instance you want to start. You can name the EC2 Instance in the second set of quotations in line 105.

The instance type refers to the type of instance, such as t3.medium, t2.micro, and so forth. The size of the instance determines how much it costs. Remember that the t2.micro is under their Free Tier, so change accordingly.

Under ami in line 107, this is referencing our datasources.tf file. We had named the aws_ami as "server_ami", so the example follows the same format as we've done before.

For line 108, setting this as "true" means that your EC2 instance will have a public ip address. This should be set to true so that you can remotely SSH into it.

For lines 115, 116, and 117, these are referencing the key name, security group, and subnet from prior sections. Make sure they match.

The root block device section refers to the size of storage within your instance.

#### AWS Instance Steps
1. Open main.tf
2. Rename main_node to whatever you'd like.
3. Type in your instance type if need be.
4. Keep associate_public_ip_address as true.
5. Fix tags as need be.
6. Make sure lines 115-117 match with your previous sections for the key, security group, and subnet.
7. Save your file.

# How to Initialize your Terraform Project and Start your EC2 Instance!
Good job, you made it to the part where you can start up your work that you've painstakingly set up. Make sure there is a .gitignore file within your repository (which is included if you already cloned it from TerraformForAbsoluteBeginners.) This will allow you to run Terraform smoothly if you were to commit changes to your own Github repository.

1. Make sure you're in the correct directory/folder on your terminal.
2. Run ```terraform init```. If it says "Terraform successfully initialized", you're on track.
3. Run ```terraform fmt``` to fix syntax.
4. Run ```terraform plan``` to show what will be created. You'll see an output that shows things either you have input in the file, or (known after apply), which means those values will change when the Ec2 instance is up and running. See what will be created in the output.
5. Run ```terraform apply``` to start the configuration, which will take some time to start up the EC2 Instance. It will ask you to type yes. If there's an error, there may be a syntax error present.
6. Once you see "Apply Complete!" log in to your AWS account on your browser. Go to the Instances page. It should look like this:

![alt text](<main node complete.jpg>)

7. You can check the associated vpc, key pair, subnet, when you click on the instance and click details below. Check the security tab below to see if the ingress and egress ports are correct.
8. Finally, run the command ```terraform destroy``` to delete everything. This will prevent you from being charged monetarily if you're in the free tier. Type yes to go through with it. 
9. Double check that the resources you originally started are deleted from the AWS console. The instance should say "terminated."

**Congratulations! You now have your own Terraform file that will start up an EC2 instance for future tinkering and exploration.**