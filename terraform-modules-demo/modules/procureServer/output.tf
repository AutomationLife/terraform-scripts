output "public_ip" {
    value = aws_instance.ec2Ubuntu.*.public_ip
}