resource "aws_security_group" "ssh_vpc" {
  name        = "test ssh and http port in this SG."
  description = "We are allowing only ssh and http traffic"

  tags = {
    Name = "ssh_http"
  }
}

resource "aws_vpc_security_group_ingress_rule" "http_rule" {
  security_group_id = aws_security_group.ssh_vpc.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "ssh_rule" {
  security_group_id = aws_security_group.ssh_vpc.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "vpc_ssh_outbound_rule" {
  security_group_id = aws_security_group.ssh_vpc.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}