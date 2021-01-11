variable "vpc_dev_id" {}
variable "vpc_dev_public_subnets" {}
variable "vpc_dev_private_subnets" {}

resource "aws_elastic_beanstalk_application" "jja_server" {
  name        = "jja_server"
  description = "jjada main server(nest)"
}

resource "aws_elastic_beanstalk_environment" "jja_server_dev" {
  name                = "jja_server_dev"
  application         = aws_elastic_beanstalk_application.jja_server.name
  solution_stack_name = "64bit Amazon Linux 2018.03 v2.24.1 running Multi-container Docker 19.03.13-ce (Generic)"
  tier                = "WebServer"

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = var.vpc_dev_id
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = join(",", var.vpc_dev_public_subnets)
  }
}

resource "aws_elastic_beanstalk_application" "jja_web" {
  name        = "jja_webr"
  description = "jjada main web server(next)"
}

resource "aws_elastic_beanstalk_environment" "jja_web_dev" {
  name                = "jja_web_dev"
  application         = aws_elastic_beanstalk_application.jja_web.name
  solution_stack_name = "64bit Amazon Linux 2018.03 v2.24.1 running Multi-container Docker 19.03.13-ce (Generic)"
  tier                = "WebServer"

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = var.vpc_dev_id
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = join(",", var.vpc_dev_private_subnets)
  }
}
