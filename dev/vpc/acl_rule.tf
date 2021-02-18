resource "aws_network_acl_rule" "vpc_dev_public_ingress_all" {
  network_acl_id = aws_network_acl.vpc_dev_public_acl.id
  rule_number    = 100
  rule_action    = "allow"
  egress         = false
  protocol       = -1
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "vpc_dev_public_engress_all" {
  network_acl_id = aws_network_acl.vpc_dev_public_acl.id
  rule_number    = 100
  rule_action    = "allow"
  egress         = true
  protocol       = -1
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "vpc_dev_private_ingress_all" {
  network_acl_id = aws_network_acl.vpc_dev_private_acl.id
  rule_number    = 100
  rule_action    = "allow"
  egress         = false
  protocol       = -1
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "vpc_dev_private_engress_all" {
  network_acl_id = aws_network_acl.vpc_dev_private_acl.id
  rule_number    = 100
  rule_action    = "allow"
  egress         = true
  protocol       = -1
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}
