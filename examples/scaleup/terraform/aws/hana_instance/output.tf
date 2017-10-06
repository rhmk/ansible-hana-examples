output "public_ip" {
  value = "${aws_instance.system.public_ip}"
}
output "public_dns" {
  value = "${aws_instance.system.public_dns}"
}
output "private_dns" {
  value = "${aws_instance.system.private_dns}"
}
