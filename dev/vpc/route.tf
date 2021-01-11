resource "aws_route" "vpc_dev_public_route" {
  route_table_id         = aws_route_table.vpc_dev_public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc_dev_ig.id
}

resource "aws_route" "vpc_dev_private_route" {
  route_table_id         = aws_route_table.vpc_dev_private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.vpc_dev_nat.id
}
