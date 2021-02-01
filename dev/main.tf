module "cloudfront" {
  source = "./cloudfront"
}

module "elasticbeanstalk" {
  source                  = "./elasticbeanstalk"
  vpc_dev_id              = module.vpc.vpc_dev_id
  vpc_dev_public_subnets  = module.vpc.vpc_dev_public_subnets
  vpc_dev_private_subnets = module.vpc.vpc_dev_private_subnets
}

module "rds" {
  source                  = "./rds"
  vpc_dev_private_subnets = module.vpc.vpc_dev_private_subnets
  vpc_dev_sg_id           = module.vpc.vpc_dev_sg_id
}

module "vpc" {
  source = "./vpc"
}
