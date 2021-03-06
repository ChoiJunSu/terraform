resource "aws_elasticache_subnet_group" "elasticache_dev_subnet_group" {
  name       = "elasticache_dev_subnet_group"
  subnet_ids = var.vpc_dev_private_subnets
}

resource "aws_elasticache_cluster" "elasticache_dev_cluster" {
  cluster_id           = "elasticache-dev"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
  engine_version       = "3.2.10"
  port                 = 6379
  subnet_group_name    = "elasticache_dev_subnet_group"
  security_group_ids   = ["sg-08493cd047bced35d"]
}