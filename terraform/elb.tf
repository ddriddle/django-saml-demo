# Create a new load balancer
resource "aws_elb" "default" {
  subnets = ["${data.aws_subnet.selected.id}"]

# https does not work?
  listener {
    instance_port      = 8000
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = "${var.ssl_certificate_id}"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:8000"
    interval            = 30
  }

  security_groups = ["${aws_security_group.elb.id}"]
  instances       = ["${aws_instance.default.*.id}"]
  tags            = "${var.tags}"
}
