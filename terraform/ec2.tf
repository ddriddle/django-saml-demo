#data "template_file" "user_data" {
#  template = "${file("${path.module}/user_data.tpl")}"
#}

# https://askubuntu.com/questions/53582/how-do-i-know-what-ubuntu-ami-to-launch-on-ec2
# https://wiki.debian.org/Cloud/AmazonEC2Image/Jessie
data "aws_ami" "selected" {
  most_recent = true

  # Lookup only public images
  executable_users = ["all"]

  filter {
    name   = "owner-id"
    values = ["${var.owner-id}"]
  }

  filter {
    name   = "name"
    values = ["${var.ami}"]
  }
  
  filter { 
    name = "root-device-type"
    values = ["ebs"]
  }

  filter { 
    name = "virtualization-type"
    values = ["hvm"]
  }

  filter { 
    name = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "default" {
  ami                    = "${data.aws_ami.selected.id}"
  instance_type          = "${var.instance_type}"

  key_name               = "ddriddle-rockband"
  subnet_id              = "${data.aws_subnet.selected.id}"

  vpc_security_group_ids = [
    "${aws_security_group.active_directory.id}",
    "${aws_security_group.domain_controller.id}"
  ]
}
