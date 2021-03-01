resource "aws_route53_record" "jenkins_dev" {
  zone_id = data.aws_route53_zone.jjada_io.id
  name    = "jenkins.jjada.io"
  type    = "A"

  alias {
    name                   = var.elb_jenkins_dev.dns_name
    zone_id                = var.elb_jenkins_dev.zone_id
    evaluate_target_health = true
  }
}