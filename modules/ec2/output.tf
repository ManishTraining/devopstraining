output "PublicIP_E2" {
  value = aws_instance.publicInstance.public_ip
}