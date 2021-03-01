output "zone_jjada_io" {
  value = data.aws_route53_zone.jjada_io
}

output "acm_jjada_io_seoul" {
  value = data.aws_acm_certificate.jjada_io_seoul
}

output "acm_jjada_io_virginia" {
  value = data.aws_acm_certificate.jjada_io_virginia
}