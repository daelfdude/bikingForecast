variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-east-1"
}

# ubuntu-trusty-14.04 (x64)
variable "aws_amis" {
  default = {
    "us-east-1" = "ami-07917569e2c4a2b6a"
    "us-west-2" = "ami-05705259d15c98ef1"
  }
}

variable "key_name" {
  description = "Name of the SSH keypair to use in AWS."
}