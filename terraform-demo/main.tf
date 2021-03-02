provider "aws" {
    region = "us-east-2"
}

#Prequisite to manage remote backend, bucket should exist before.
terraform {
    backend "s3" {
        bucket = "thinknyx"
        key = "abhijith.tfstate"
        region = "us-east-2"
    }
}

# Creating a server
resource "aws_instance" "servers" {
    #Defination Block, Arguments
    instance_type = var.instance_type
    # ami - Amazon Machine Image
    ami = "ami-0996d3051b72b5b2c" 
    # Name is the default tag to provide name for the instance, we can add any number of tages.
    tags = {
        Name = var.name
        Client = var.client
    }
    # <Resource-type>.<Resource-name>.id
    vpc_security_group_ids = [ aws_security_group.securityGroup.id ]
    key_name = "kul-labs"
}

output "server-public_ip" {
    # aws_resource.<name-of-resource>.<field>
    value = aws_instance.servers.public_ip
}

