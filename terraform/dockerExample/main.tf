# Specify the provider and access details
provider "aws" {
  profile                 = "terraform"
  shared_credentials_file = "~/.aws/credentials"
  region                  = "${var.aws_region}"
}

resource "aws_eip" "default" {
  instance = "${aws_instance.docker.id}"
  vpc      = true
}

# Our default security group to access
# the instances over SSH and HTTP
resource "aws_security_group" "default" {
  name        = "docker_example"
  description = "Used in the terraform"

  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "docker" {
  instance_type = "t2.micro"

  # Lookup the correct AMI based on the region
  # we specified
  ami = "${lookup(var.aws_amis, var.aws_region)}"

  # The name of our SSH keypair you've created and downloaded
  # from the AWS console.
  #
  # https://console.aws.amazon.com/ec2/v2/home?region=us-west-2#KeyPairs:
  #
  key_name = "${var.key_name}"

  # Our Security group to allow HTTP and SSH access
  security_groups = ["${aws_security_group.default.name}"]

  # We run a remote provisioner on the instance after creating it.
  # user_data = "${file("userdata.sh")}"

  #Instance tags
  tags {
    name = "docker-example"
  }

  provisioner "file" {
    source = "tarball"
    destination = "tarball"
    connection {
	type = "ssh"
	user = "ubuntu"
        private_key = "${file("~/.ssh/terraform.pem")}"
    }
  }

  provisioner "remote-exec" {
    inline = ["cat tarball >  /tmp/proof"]
    connection {
	type = "ssh"
	user = "ubuntu"
        private_key = "${file("~/.ssh/terraform.pem")}"
    }
  }
}

resource "aws_route53_record" "docker" {
	zone_id = "Z8F4URHLLB1PO"
	name = "docker.techlunchcrew.us"
	type = "A"
	ttl = "300"
	records = ["${aws_eip.default.public_ip}"]
}
