resource "aws_network_acl_rule" "vpc_dev_public_ingress_80" {
  network_acl_id = aws_network_acl.vpc_dev_public_acl.id
  rule_number    = 100
  rule_action    = "allow"
  egress         = false
  protocol       = "tcp"
  cidr_block     = "0.0.0.0/0"
  from_port      = 80
  to_port        = 80
}

resource "aws_network_acl_rule" "vpc_dev_public_engress_80" {
  network_acl_id = aws_network_acl.vpc_dev_public_acl.id
  rule_number    = 100
  rule_action    = "allow"
  egress         = true
  protocol       = "tcp"
  cidr_block     = "0.0.0.0/0"
  from_port      = 80
  to_port        = 80
}

resource "aws_network_acl_rule" "vpc_dev_public_ingress_443" {
  network_acl_id = aws_network_acl.vpc_dev_public_acl.id
  rule_number    = 110
  rule_action    = "allow"
  egress         = false
  protocol       = "tcp"
  cidr_block     = "0.0.0.0/0"
  from_port      = 443
  to_port        = 443
}

resource "aws_network_acl_rule" "vpc_dev_public_engress_443" {
  network_acl_id = aws_network_acl.vpc_dev_public_acl.id
  rule_number    = 110
  rule_action    = "allow"
  egress         = true
  protocol       = "tcp"
  cidr_block     = "0.0.0.0/0"
  from_port      = 443
  to_port        = 443
}

resource "aws_network_acl_rule" "vpc_dev_public_ingress_22" {
  network_acl_id = aws_network_acl.vpc_dev_public_acl.id
  rule_number    = 120
  rule_action    = "allow"
  egress         = false
  protocol       = "tcp"
  cidr_block     = "0.0.0.0/0"
  from_port      = 22
  to_port        = 22
}

resource "aws_network_acl_rule" "vpc_dev_public_engress_22" {
  network_acl_id = aws_network_acl.vpc_dev_public_acl.id
  rule_number    = 120
  rule_action    = "allow"
  egress         = true
  protocol       = "tcp"
  cidr_block     = aws_vpc.vpc_dev.cidr_block
  from_port      = 22
  to_port        = 22
}

resource "aws_network_acl_rule" "vpc_dev_private_ingress_internal" {
  network_acl_id = aws_network_acl.vpc_dev_private_acl.id
  rule_number    = 100
  rule_action    = "allow"
  egress         = false
  protocol       = -1
  cidr_block     = aws_vpc.vpc_dev.cidr_block
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "vpc_dev_private_engress_internal" {
  network_acl_id = aws_network_acl.vpc_dev_private_acl.id
  rule_number    = 100
  rule_action    = "allow"
  egress         = true
  protocol       = -1
  cidr_block     = aws_vpc.vpc_dev.cidr_block
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "vpc_dev_private_engress_80" {
  network_acl_id = aws_network_acl.vpc_dev_private_acl.id
  rule_number    = 110
  rule_action    = "allow"
  egress         = true
  protocol       = "tcp"
  cidr_block     = "0.0.0.0/0"
  from_port      = 80
  to_port        = 80
}

resource "aws_network_acl_rule" "vpc_dev_private_engress_443" {
  network_acl_id = aws_network_acl.vpc_dev_private_acl.id
  rule_number    = 120
  rule_action    = "allow"
  egress         = true
  protocol       = "tcp"
  cidr_block     = "0.0.0.0/0"
  from_port      = 443
  to_port        = 443
}
