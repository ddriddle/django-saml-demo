data "aws_route53_zone" "selected" {
  name         = "sandbox.aws.illinois.edu."
  private_zone = false
}

resource "aws_route53_record" "default" {
  zone_id = "${data.aws_route53_zone.selected.zone_id}"
  name    = "drone"
  type    = "CNAME"
  ttl     = "5"
  records = ["${aws_elb.default.dns_name}"]
}
