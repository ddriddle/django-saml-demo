#ami = "amzn-ami-hvm-*-x86_64-gp2"
#ami      = "ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"
#owner-id = "099720109477"

ami      = "debian-jessie-*"
owner-id = "379101102735"

vpc = "techsvcsandbox-vpc"
subnet = "techsvcsandbox-public1-a-net"
ssl_certificate_id = "arn:aws:acm:us-east-2:378517677616:certificate/32b9d5d8-d276-4c23-afa1-ee869aeb1981"

tags = {
  netid = "ddriddle"
  Netid = "ddriddle"
  NetID = "ddriddle"
}
