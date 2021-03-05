resource "aws_s3_bucket" "jjada_resource" {
  bucket = "jjada-resource-dev"
}

resource "aws_s3_bucket_public_access_block" "jjada_resource_pab" {
  bucket                  = aws_s3_bucket.jjada_resource.id
  block_public_acls       = true
  block_public_policy     = false
  ignore_public_acls      = true
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "jjada_resource_policy" {
  bucket = aws_s3_bucket.jjada_resource.id
  policy = jsonencode({
    Version = "2012-10-17",
    Id      = "jjada_resource_policy",
    Statement = [
      {
        Sid    = "0",
        Effect = "Allow",
        Principal = {
          AWS = "arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity E192R92R213XUP"
        },
        Action   = "s3:GetObject",
        Resource = "${aws_s3_bucket.jjada_resource.arn}/*"
      }
    ]
  })
}