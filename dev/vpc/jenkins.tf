resource "aws_route53_zone" "zone_dev_jenkins" {
  name = "jenkins.jjada.io"
}

resource "aws_security_group" "vpc_dev_jenkins_sg" {
  name        = "jenkins"
  description = "sg for jenkins"
  vpc_id      = aws_vpc.vpc_dev.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

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
      from_port   = 8080
      to_port     = 8080
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

resource "aws_instance" "vpc_dev_jenkins" {
  ami               = data.aws_ami.amazon-linux-2.id
  availability_zone = aws_subnet.vpc_dev_public_subnet1.availability_zone
  instance_type     = "t2.micro"
  key_name          = "jjada-keypair"
  iam_instance_profile = "EC2SSM"
  vpc_security_group_ids = [
    aws_default_security_group.vpc_dev_sg.id,
    aws_security_group.vpc_dev_jenkins_sg.id
  ]
  subnet_id                   = aws_subnet.vpc_dev_public_subnet1.id
  associate_public_ip_address = true
  tags = {
    Name = "jenkins-dev"
  }
}

resource "aws_eip" "vpc_dev_eip_jenkins" {
  vpc        = true
  instance   = aws_instance.vpc_dev_jenkins.id
  depends_on = [aws_internet_gateway.vpc_dev_ig]
}

resource "aws_route53_record" "record_dev_jenkins" {
  zone_id = aws_route53_zone.zone_dev_jenkins.zone_id
  name    = "jenkins.jjada.io"
  type    = "A"
  ttl     = "300"
  records = [aws_eip.vpc_dev_eip_jenkins.public_ip]
}