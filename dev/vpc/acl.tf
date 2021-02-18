resource "aws_network_acl" "vpc_dev_public_acl" {
  vpc_id = aws_vpc.vpc_dev.id
  subnet_ids = [
    aws_subnet.vpc_dev_public_subnet1.id,
    aws_subnet.vpc_dev_public_subnet2.id,
  ]

  tags = {
    Name = "vpc_dev_public_acl"
  }
}

resource "aws_network_acl" "vpc_dev_private_acl" {
  vpc_id = aws_vpc.vpc_dev.id
  subnet_ids = [
    aws_subnet.vpc_dev_private_subnet1.id,
    aws_subnet.vpc_dev_private_subnet2.id
  ]

  tags = {
    Name = "vpc_dev_private_acl"
  }
}
