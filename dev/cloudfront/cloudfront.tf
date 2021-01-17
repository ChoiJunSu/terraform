# local variables
locals {
  s3_origin_id = "jjada_resource_dev"
}

# cloudfront distribution
resource "aws_cloudfront_distribution" "jjada_resource_dev" {
  # s3 origin
  origin {
    domain_name = aws_s3_bucket.jjada_resource_dev.bucket_regional_domain_name
    origin_id = local.s3_origin_id
    s3_origin_config {
      origin_access_identity = "origin-access-identity/cloudfront/E1CEN813DRRYNW"
    }
  }

  # general
  enabled = true
  is_ipv6_enabled = true
  default_root_object = "index.html"
  aliases = ["resource.jjada.io"]
  price_class = "PriceClass_200"

  # acm
  viewer_certificate {
    acm_certificate_arn = "arn:aws:acm:us-east-1:255765745020:certificate/96b18ea9-1049-47f6-b775-8a811dbddfd2"
  }

  # error
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

  # cache
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

  # tags
  tags = {
    Environment = "development"
  }

}