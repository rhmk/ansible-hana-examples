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
  #instance_type = "t2.micro"
  instance_type = "r4.xlarge"
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

resource "aws_ebs_volume" "usrsap" {
    availability_zone = "${var.az}"
    size = 50 
}
resource "aws_volume_attachment" "ebs_att_usrsap" {
  device_name = "/dev/sdb"
  volume_id   = "${aws_ebs_volume.usrsap.id}"
  instance_id = "${aws_instance.system.id}"
}
resource "aws_ebs_volume" "hana" {
    availability_zone = "${var.az}"
    size = 80 
}
resource "aws_volume_attachment" "ebs_att_hana" {
  device_name = "/dev/sdc"
  volume_id   = "${aws_ebs_volume.hana.id}"
  instance_id = "${aws_instance.system.id}"
}


