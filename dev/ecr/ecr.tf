resource "aws_ecr_repository" "jja_web_dev" {
  name                 = "jja_web_dev"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "jja_server_dev" {
  name                 = "jja_server_dev"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}