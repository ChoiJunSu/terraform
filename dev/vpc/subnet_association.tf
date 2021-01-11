resource "aws_route_table_association" "vpc_dev_public_subnet1_association" {
  subnet_id      = aws_subnet.vpc_dev_public_subnet1.id
  route_table_id = aws_route_table.vpc_dev_public_route_table.id
}

resource "aws_route_table_association" "vpc_dev_public_subnet2_association" {
  subnet_id      = aws_subnet.vpc_dev_public_subnet2.id
  route_table_id = aws_route_table.vpc_dev_public_route_table.id
}

resource "aws_route_table_association" "vpc_dev_private_subnet1_association" {
  subnet_id      = aws_subnet.vpc_dev_private_subnet1.id
  route_table_id = aws_route_table.vpc_dev_private_route_table.id
}

resource "aws_route_table_association" "vpc_dev_private_subnet2_association" {
  subnet_id      = aws_subnet.vpc_dev_private_subnet2.id
  route_table_id = aws_route_table.vpc_dev_private_route_table.id
}
