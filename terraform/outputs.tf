output "address" {
  value = "${aws_instance.web.dns_name}"
}
