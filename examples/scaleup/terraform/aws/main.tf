# Source https://github.com/terraform-providers/terraform-provider-aws/tree/master/examples/two-tier

provider "aws" {
  region = "${var.aws_region}"
  
}

resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.default.id}"
}

resource "aws_route" "internet_access" {
  route_table_id         = "${aws_vpc.default.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.default.id}"
}

resource "aws_subnet" "hanadc1" {
  vpc_id                  = "${aws_vpc.default.id}"
  cidr_block              = "10.0.1.0/24"
  availability_zone = "eu-central-1b"
  map_public_ip_on_launch = true
}

resource "aws_security_group" "default" {
  name        = "terraform_example"
  description = "Used in the terraform"
  vpc_id      = "${aws_vpc.default.id}"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "auth" {
  key_name   = "${var.key_name}"
  public_key = "${file(var.public_key_path)}"
}

module "system01dc1" {
  source  = "./hana_instance"
  ip_1 = "10.0.1.101"
  ip_2 = "10.0.2.101"
  aws_amis = "${lookup(var.aws_amis, var.aws_region)}"
  aws_security_group_default = "${aws_security_group.default.id}"
  aws_key_pair = "${aws_key_pair.auth.id}"
  aws_subnet = "${aws_subnet.hanadc1.id}"
  az = "eu-central-1b"
}

