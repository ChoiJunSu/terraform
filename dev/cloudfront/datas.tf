provider "aws" {
  alias = "virginia"
  region = "us-east-1"
  profile = "jjada"
}

data "aws_acm_certificate" "jjada_resource" {
  provider = aws.virginia
  domain   = "resource.jjada.io"
  types = ["AMAZON_ISSUED"]
}