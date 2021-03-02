resource "aws_instance" "ec2Ubuntu" {
    ami = "ami-0996d3051b72b5b2c"
    key_name = var.key_name
    instance_type = var.instance_type
    tags = {
        Name = var.Name
        Client = var.Client
    }
    count = var.quantity
}