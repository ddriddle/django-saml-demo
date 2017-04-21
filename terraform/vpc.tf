data "aws_vpc" "selected" {
  tags {
    Name = "${var.vpc}"
  }
}

data "aws_subnet" "selected" {
  tags {
    Name = "${var.subnet}"
  }
}
