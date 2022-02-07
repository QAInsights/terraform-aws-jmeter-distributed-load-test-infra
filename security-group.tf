
resource "aws_security_group" "jmeter_security_group" {
  name        = "JMeter security group"
  description = "Allow communication between instances"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group_rule" "jmeter_all_ingress" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  self              = true # allow traffic from the VPC to the security group
  security_group_id = aws_security_group.jmeter_security_group.id
}
resource "aws_security_group_rule" "jmeter_ssh_ingress" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.jmeter_security_group.id
}

resource "aws_security_group_rule" "private_egress" {
  type      = "egress"
  from_port = 0
  to_port   = 0
  protocol  = -1
  self      = true

  security_group_id = aws_security_group.jmeter_security_group.id
}

resource "aws_security_group_rule" "public-egress" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = -1
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.jmeter_security_group.id
}