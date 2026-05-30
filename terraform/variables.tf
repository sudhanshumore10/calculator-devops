variable "aws_region" {
  default = "ap-south-1"
}

variable "instance_type_jenkins" {
  default = "t2.small"
}

variable "instance_type_sonar" {
  default = "t2.small"
}

variable "key_name" {
  description = "EC2 key pair name"
}