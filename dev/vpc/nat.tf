// NAT on public subnet 1 (in first AZ)
resource "aws_nat_gateway" "vpc_dev_nat" {
  allocation_id = aws_eip.vpc_dev_eip.id
  subnet_id     = aws_subnet.vpc_dev_public_subnet1.id
  depends_on    = [aws_internet_gateway.vpc_dev_ig]
}
