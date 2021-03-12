resource "aws_db_subnet_group" "rds_dev_subnet_group" {
  name       = "rds_dev_subnet_group"
  subnet_ids = var.vpc_dev_private_subnets
}

resource "aws_db_instance" "rds_dev" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "12.5"
  instance_class       = "db.t2.micro"
  name                 = "jja_db_dev"
  username             = "root"
  password             = "LSV6ycuw4EuKwUtW"
  parameter_group_name = aws_db_parameter_group.parameter_group.name

  db_subnet_group_name   = aws_db_subnet_group.rds_dev_subnet_group.id
  vpc_security_group_ids = [var.security_group_default.id]
}
