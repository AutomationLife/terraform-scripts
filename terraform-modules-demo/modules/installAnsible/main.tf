resource "null_resource" "installAnsible" {
    provisioner "remote-exec" {  # Provisioner types: remote-exec, local-exec, file
      connection {
        type = "ssh"
        user = var.user
        host = var.host
        private_key = file(var.pemFile)
      }
      inline = [
        "sudo apt-get update -y", 
        "sudo apt-get install -y ansible",
        "ansible --version",
        ]
  }
}