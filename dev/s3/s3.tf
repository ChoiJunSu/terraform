# bucket
resource "aws_s3_bucket" "jjada_resource_dev" {
  bucket = "jjada-resouce-dev"
}

# bucket_public_access_block
resource "aws_s3_bucket_public_access_block" "jjada_resource_dev_pab" {\
    bucket = aws_s3_bucket.jjada_resource_dev.id
    block_public_acls = true
    block_public_policy = false
    ignore_public_acls = true
    restrict_public_buckets = false
}

# bucket policy
resource "aws_s3_bucket_policy" "jjada_resource_dev_policy" {
  bucket = aws_s3_bucket.jjada_resource_dev.id
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Id": "jjada_resource_dev_policy",
    "Statement": [
        {
            "Sid": "0",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity E1CEN813DRRYNW"
            },
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::jjada-resource-dev/*"
        }
    ]
}
POLICY
}