# VPC Security Group
resource "aws_security_group" "VPC-SG" {
  name        = "${var.environment}-VPC-SG"
  description = "VPC Security Group"
  vpc_id      = "${aws_vpc.vpc.id}"
  depends_on  = [aws_vpc.vpc]

  ingress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = true
  }

  egress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = "true"
  }

  tags = {
    Name        = "${var.environment}"
    Environment = "${var.environment}"
  }
}

# ELV Security Group
resource "aws_security_group" "ELB-SG" {
  name        = "${var.environment}-ELB-SG"
  description = "ELB Security Group"
  vpc_id      = "${aws_vpc.vpc.id}"
  depends_on  = [aws_vpc.vpc]

  ingress {
    from_port = "80"
    to_port   = "80"
    protocol  = "tcp"
    self      = true
  }

  ingress {
    from_port = "443"
    to_port   = "443"
    protocol  = "tcp"
    self      = true
  }

  egress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = "true"
  }

  tags = {
    Name        = "${var.environment}-ELB"
    Environment = "${var.environment}"
  }
}