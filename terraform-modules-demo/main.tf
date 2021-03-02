provider "aws" {
    region = "us-east-2"
}

module "createServer" {
    source = "./modules/procureServer"
}

module "installAnsible" {
    depends_on = [ module.createServer ]
    for_each = toset(module.createServer.public_ip)
    source = "./modules/installAnsible"
    host = each.value
    pemFile = "./kul-labs.pem"
}

module "createManagedServer" {
    source = "./modules/procureServer"
    quantity = 2
}

output "public_ips" {
    value = module.createServer.public_ip
}

output "public_ips-managedServeers" {
    value = module.createManagedServer.public_ip
}