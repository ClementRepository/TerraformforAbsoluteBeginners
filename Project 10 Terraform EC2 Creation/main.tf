resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "main_public_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name = "main-public-1"
  }
}
#If you named your VPC differently, you will need to refer to it properly in vpc_id. If you named it as "best", your vpc_id should say aws_vpc.best.id to refer it.
#You will need to refer to it every time vpc_id comes up in the section below. I kept it as "main" since it's easy to remember.
resource "aws_subnet" "main_public_subnet_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-2b" # Change to your desired AZ

  tags = {
    Name = "main-public-2"
  }
}

resource "aws_internet_gateway" "main_internet_gateway" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main_igw"
  }
}

resource "aws_route_table" "main_public_rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main_public_rt"
  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.main_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main_internet_gateway.id
}

resource "aws_route_table_association" "main_public_assoc" {
  subnet_id      = aws_subnet.main_public_subnet.id
  route_table_id = aws_route_table.main_public_rt.id
}

resource "aws_security_group" "main_sg" {
  name        = "main_sg"
  description = "main security group"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["IP ADDRESS/32"]
  }
#Remember, port 22 is how you can access things through SSH. Change the cidr_block to your IP address, followed by /32 within those brackets and quotations.
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "main_auth" {
  key_name   = "mainkey"
  public_key = "ssh-ed25519 PUBKEY user@Your-Computer"
}
#in public key, have ssh-ed25519 followed by your public key, then your usual user@computer that you see in your wsl terminal, all within quotation marks.

resource "aws_instance" "main_node" {
  instance_type               = "t2.micro"
  ami                         = data.aws_ami.server_ami.id
  associate_public_ip_address = true

  tags = {
    Name = "main_node"
  }
  #Note that we chose a t2.micro, which is under the free tier. You're welcome to use other EC2 types, but this is the least expensive.

  key_name               = aws_key_pair.main_auth.id
  vpc_security_group_ids = [aws_security_group.main_sg.id]
  subnet_id              = aws_subnet.main_public_subnet.id

  root_block_device {
    volume_size = 8
  }
}

#1 Terraform init
#2 terraform fmt
#3 terraform validate
#4 terraform plan
#5 terraform apply
#6 terraform show
#7 ansible-playbook -i hosts.yaml install_nginx.yaml

#