resource "aws_instance" "vpc_dev_bastion" {
  ami               = data.aws_ami.ubuntu.id
  availability_zone = aws_subnet.vpc_dev_public_subnet1.availability_zone
  instance_type     = "t2.nano"
  key_name          = "jjada-keypair"
  iam_instance_profile = "aws-elasticbeanstalk-ec2-role"
  vpc_security_group_ids = [
    data.aws_security_group.default.id,
    data.aws_security_group.bastion.id
  ]
  subnet_id                   = aws_subnet.vpc_dev_public_subnet1.id
  associate_public_ip_address = true
  tags = {
    Name = "bastion-dev"
  }
}

resource "aws_eip" "vpc_dev_eip_bastion" {
  vpc        = true
  instance   = aws_instance.vpc_dev_bastion.id
  depends_on = [aws_internet_gateway.vpc_dev_ig]
}
