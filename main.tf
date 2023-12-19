resource "aws_security_group" "standard" {
  name        = "${var.basename}-standard"
  description = "Standard set of rules to apply on all EC2 instances"
  vpc_id      = var.vpc_id
  tags = {
    Name                  = "${var.basename}-standard-sg"
  }
}

resource "aws_security_group_rule" "ingress-private-ipv4" {
  security_group_id = aws_security_group.standard.id
  type              = "ingress"
  cidr_blocks       = var.allow_any_from_cidr_blocks
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  description       = "Ingress from private IPv4"
}

resource "aws_security_group_rule" "ingress-ssh-ipv4" {
  security_group_id = aws_security_group.standard.id
  type              = "ingress"
  cidr_blocks       = var.allow_ssh_cidr_blocks
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  description       = "IPv4 SSH"
}

resource "aws_security_group_rule" "ingress-ssh-ipv6" {
  security_group_id = aws_security_group.standard.id
  type              = "ingress"
  ipv6_cidr_blocks  = var.allow_ssh_ipv6_cidr_blocks
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  description       = "IPv6 SSH"
}

resource "aws_security_group_rule" "ingress-icmp-ipv4" {
  security_group_id = aws_security_group.standard.id
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = "-1"
  to_port           = "-1"
  protocol          = "icmp"
  description       = "ICMPv4"
}

resource "aws_security_group_rule" "ingress-icmp-ipv6" {
  security_group_id = aws_security_group.standard.id
  type              = "ingress"
  ipv6_cidr_blocks  = ["::/0"]
  from_port         = "-1"
  to_port           = "-1"
  protocol          = "icmpv6"
  description       = "ICMPv6"
}

resource "aws_security_group_rule" "egress-ipv4" {
  security_group_id = aws_security_group.standard.id
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  description       = "IPv4 egress"
}

resource "aws_security_group_rule" "egress-ipv6" {
  security_group_id = aws_security_group.standard.id
  type              = "egress"
  ipv6_cidr_blocks  = ["::/0"]
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  description       = "IPv6 egress"
}
