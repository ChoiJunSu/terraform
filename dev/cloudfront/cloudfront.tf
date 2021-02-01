locals {
  s3_origin_id = "jjada_resource"
}

resource "aws_s3_bucket" "jjada_resource" {
  bucket = "jjada-resouce-dev"
}

resource "aws_s3_bucket_public_access_block" "jjada_resource_pab" {
    bucket = aws_s3_bucket.jjada_resource.id
    block_public_acls = true
    block_public_policy = false
    ignore_public_acls = true
    restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "jjada_resource_policy" {
  bucket = aws_s3_bucket.jjada_resource.id
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Id": "jjada_resource_policy",
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

resource "aws_cloudfront_distribution" "jjada_resource" {
  origin {
    domain_name = aws_s3_bucket.jjada_resource.bucket_regional_domain_name
    origin_id = local.s3_origin_id
    s3_origin_config {
      origin_access_identity = "origin-access-identity/cloudfront/E1CEN813DRRYNW"
    }
  }

  enabled = true
  is_ipv6_enabled = true
  default_root_object = "index.html"
  aliases = ["resource.jjada.io"]
  price_class = "PriceClass_200"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn = "arn:aws:acm:us-east-1:255765745020:certificate/96b18ea9-1049-47f6-b775-8a811dbddfd2"
  }

  custom_error_response {
    error_code = 403
    response_code = 200
    response_page_path = "/error.jpg"
  }
  custom_error_response {
      error_code = 404
      response_code = 200
      response_page_path = "/error.jpg"
  }

  default_cache_behavior {
    allowed_methods = ["GET", "HEAD"]
    cached_methods = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
    viewer_protocol_policy = "https-only"
    min_ttl = 0
    default_ttl = 3600
    max_ttl = 86400
  }
}