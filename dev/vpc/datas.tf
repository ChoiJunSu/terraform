data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "jenkins_dev" {
 most_recent = true

 filter {
   name   = "name"
   values = ["jenkins_dev_2"]
 }

  owners = ["self"]
}

data "aws_security_group" "default" {
  id = "sg-02ba1894dc9436e2c"
}

data "aws_security_group" "jenkins" {
  id = "sg-09e52c72222b286bf"
}

data "aws_security_group" "bastion" {
  id = "sg-0035f5f755871c32e"
}