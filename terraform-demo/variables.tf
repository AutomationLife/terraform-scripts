variable "name" {
    description = "Used to create tag Name for the resources created, e.g. abhi, Abhijith"
    type = string
}

variable "client" {
    description = "Used to create tag Name (client) for the resources created, e.g. Google, IBM"
    type = string
}

variable "instance_type" {
    description = "Used to create tag Name (client) for the resources created, e.g. Google, IBM"
    type = string
    default = "t2.micro"
}