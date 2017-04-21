output "hostname" {
 value = ["${aws_elb.default.dns_name}"]
}

output "public_ips" {
  value = ["${aws_instance.default.*.public_ip}"]
}

output "private_ips" {
  value = ["${aws_instance.default.*.private_ip}"]
}

output "availability_zones" {
  value = ["${aws_instance.default.*.availability_zone}"]
}
