resource "aws_db_parameter_group" "parameter_group" {
  name   = "rds-pg"
  family = "postgres12"
}
