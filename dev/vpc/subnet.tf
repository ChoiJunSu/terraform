resource "aws_subnet" "vpc_dev_public_subnet1" {
  vpc_id                  = aws_vpc.vpc_dev.id
  cidr_block              = "10.10.1.0/24"
  map_public_ip_on_launch = false
  availability_zone       = data.aws_availability_zones.available.names[0]
}

resource "aws_subnet" "vpc_dev_public_subnet2" {
  vpc_id                  = aws_vpc.vpc_dev.id
  cidr_block              = "10.10.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[1]
}

resource "aws_subnet" "vpc_dev_private_subnet1" {
  vpc_id            = aws_vpc.vpc_dev.id
  cidr_block        = "10.10.10.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]
}

resource "aws_subnet" "vpc_dev_private_subnet2" {
  vpc_id            = aws_vpc.vpc_dev.id
  cidr_block        = "10.10.11.0/24"
  availability_zone = data.aws_availability_zones.available.names[1]
}
