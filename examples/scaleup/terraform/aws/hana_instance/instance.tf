variable "ip_1" {}
variable "ip_2" {}
variable "aws_amis" {}
variable aws_security_group_default {}
variable aws_key_pair {}
variable aws_subnet {}
variable az {}

resource "aws_instance" "system" {
  connection {
    user = "ec2-user"
    private_key = "${file("/root/.ssh/id_rsa")}"
    agent = false
  }
  instance_type = "t2.micro"
  availability_zone = "${var.az}"
  ami = "${var.aws_amis}"
  key_name = "${var.aws_key_pair}"
  vpc_security_group_ids = ["${var.aws_security_group_default}"]
  subnet_id = "${var.aws_subnet}"
  private_ip = "${var.ip_1}"
  provisioner "remote-exec" {
    inline = [
      "sudo mkdir -p /hana/hana_inst",
      "sudo bash -c \"echo $(ip a |grep -v inet6 |grep -v 127.0.0.1 | grep inet | awk {'print $2'} | awk -F'/' {'print $1'}) $(hostname -f) $(hostname -s) >> /etc/hosts\"",
      "sudo  hostnamectl set-hostname $(hostname -s)",
      
    ]
  }
}

