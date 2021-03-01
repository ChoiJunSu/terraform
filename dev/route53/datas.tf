provider "aws" {
  alias = "virginia"
  region = "us-east-1"
  profile = "jjada"
}

data "aws_route53_zone" "jjada_io" {
  name         = "jjada.io"
  private_zone = false
}

data "aws_acm_certificate" "jjada_io_seoul" {
  domain   = "*.jjada.io"
  types    = ["AMAZON_ISSUED"]
}

data "aws_acm_certificate" "jjada_io_virginia" {
  domain   = "*.jjada.io"
  types    = ["AMAZON_ISSUED"]
  provider = aws.virginia
}