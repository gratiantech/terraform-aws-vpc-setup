resource "aws_lb" "elb" {
  name               = "${var.environment}-ELB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ELB-SG.id]
  subnets            = "${aws_subnet.public_subnet.*.id}"

  enable_deletion_protection = true

  tags = {
    Name        = "${var.environment}-ELB"
    Environment = "${var.environment}"
  }
}