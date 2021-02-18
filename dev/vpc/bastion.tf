
resource "aws_security_group" "vpc_dev_bastion_sg" {
  name        = "bastion"
  description = "sg for basation"
  vpc_id      = aws_vpc.vpc_dev.id

  ingress {
    from_port   = 22
    to_port     = 22
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

resource "aws_instance" "vpc_dev_bastion" {
  ami               = data.aws_ami.ubuntu.id
  availability_zone = aws_subnet.vpc_dev_public_subnet1.availability_zone
  instance_type     = "t2.nano"
  key_name          = "jjada-keypair"
  vpc_security_group_ids = [
    aws_default_security_group.vpc_dev_sg.id,
    aws_security_group.vpc_dev_bastion_sg.id
  ]
  subnet_id                   = aws_subnet.vpc_dev_public_subnet1.id
  associate_public_ip_address = true
}

resource "aws_eip" "vpc_dev_eip_bastion" {
  vpc        = true
  instance   = aws_instance.vpc_dev_bastion.id
  depends_on = [aws_internet_gateway.vpc_dev_ig]
}
