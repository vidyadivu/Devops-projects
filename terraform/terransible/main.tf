provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = var.amiid
  instance_type = var.type
  key_name      = var.pemfile
  vpc_security_group_ids = [var.sg]


  provisioner "local-exec" {
    command = "sleep 30; ansible-playbook -i ${self.private_ip}, -u ${var.user} --key-file ${var.pemfile}.pem sample.yml"
  }
}
