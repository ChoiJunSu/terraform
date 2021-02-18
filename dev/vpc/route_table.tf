resource "aws_route_table" "vpc_dev_public_route_table" {
  vpc_id = aws_vpc.vpc_dev.id

  tags = {
    Name = "vpc_dev_public_route_table"
  }
}

resource "aws_route_table" "vpc_dev_private_route_table" {
  vpc_id = aws_vpc.vpc_dev.id

  tags = {
    Name = "vpc_dev_private_route_table"
  }
}
