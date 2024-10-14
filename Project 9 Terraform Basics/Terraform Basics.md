# Learn Terraform Basics
## What is this?
Terraform is an example of "Infrastructure as Code" software that allows users to set a blueprint for their work and be re-configured across different sources to be re-used. (Basically, allowing you to set up everything once and not need to create everything manually again.)

## Objective
You will be able to install Terraform and use relevant Terraform commands to initialize and create an EC2 instance, from your computer (rather than using the AWS console or dashboard.)

## Links
[What is Terraform](https://developer.hashicorp.com/terraform/intro)

[Spacelift Terraform Explanation](https://spacelift.io/blog/what-is-terraform)

[Infrastructure as Code](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/infrastructure-as-code)

[Terraform Explained in 15 minutes](https://www.youtube.com/watch?v=l5k1ai_GBDE)

## Vocabulary and Commands
HCL: Hashicorp Configuration Language. This language is used by Terraform and is considered human readable and can deploy cloud resources when configured.

IaC: Infrastructure as Code which allows users to set up their work environment without needing to change everything over and over. This vastly speeds up the process by re-using the same configuration.

```terraform init```: Starts up your terraform project.

```terraform plan```: Shows you what your terraform resources are, within your configuration file.

```terraform fmt```: Fixes formatting or syntax issues.

```terraform apply```: Applies the terraform resources in your configuration files.

```terraform show```: Shows what resources are present and applied.

```terraform destroy```: Deletes and destroys anything that terraform applied earlier.




