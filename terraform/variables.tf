variable "vpc" {
  description = "Create the EC2 Instances in this VPC."
  type        = "string"
}

variable "subnet" {
  description = "Create an EC2 Instance in this subnet."
  type        = "string"
}

variable "ami" {
  description = "A regex to search for the AMI to use."
  type        = "string"
}

variable "owner-id" {
  description = "The owner-id of the AMI to search for"
  type        = "string"
}

variable "instance_type" {
  description = "The type of instance to start."
  default     = "t2.nano"
}

variable "ssl_certificate_id" {
  description = "SSL Certificate ID"
}

variable "tags" {
  type    = "map"
  default = {}
}
