resource "aws_internet_gateway" "vpc_dev_ig" {
  vpc_id = aws_vpc.vpc_dev.id
}
