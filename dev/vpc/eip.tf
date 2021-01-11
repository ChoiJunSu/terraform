resource "aws_eip" "vpc_dev_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.vpc_dev_ig]
}
