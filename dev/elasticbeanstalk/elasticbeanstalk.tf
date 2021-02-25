resource "aws_elastic_beanstalk_application" "jja_server" {
  name        = "jja_server"
  description = "jjada main server(nest)"
}

resource "aws_elastic_beanstalk_environment" "jja_server_dev" {
  name                = "jja-server-dev"
  application         = aws_elastic_beanstalk_application.jja_server.name
  solution_stack_name = "64bit Amazon Linux 2018.03 v2.16.4 running Docker 19.03.13-ce"
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
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }
}

resource "aws_elastic_beanstalk_application" "jja_web" {
  name        = "jja_web"
  description = "jjada main web server(next)"
}

resource "aws_elastic_beanstalk_environment" "jja_web_dev" {
  name                = "jja-web-dev"
  application         = aws_elastic_beanstalk_application.jja_web.name
  solution_stack_name = "64bit Amazon Linux 2018.03 v2.16.4 running Docker 19.03.13-ce"
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
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }
}

resource "aws_elastic_beanstalk_application" "api_gateway" {
  name        = "api_gateway"
  description = "kong gateway"
}

resource "aws_elastic_beanstalk_environment" "api_gateway_dev" {
  name                = "api-gateway-dev"
  application         = aws_elastic_beanstalk_application.api_gateway.name
  solution_stack_name = "64bit Amazon Linux 2018.03 v2.25.0 running Multi-container Docker 19.03.13-ce (Generic)"
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
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }
}
