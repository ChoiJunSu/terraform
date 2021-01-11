resource "aws_db_parameter_group" "parameter_group" {
  name   = "rds-pg"
  family = "postgres12"

  parameter {
    name  = "character_set_client"
    value = "utf8mb4"
  }
  parameter {
    name  = "character_set_connection"
    value = "utf8mb4"
  }
  parameter {
    name  = "character_set_database"
    value = "utf8mb4"
  }
  parameter {
    name  = "character_set_results"
    value = "utf8mb4"
  }
  parameter {
    name  = "character_set_server"
    value = "utf8mb4"
  }
  parameter {
    name  = "collation_connection"
    value = "utf8mb4_unicode_ci"
  }
  parameter {
    name  = "collation_server"
    value = "utf8mb4_unicode_ci"
  }
}
