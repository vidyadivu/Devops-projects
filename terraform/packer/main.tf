provider "aws" {
  region = "ap-south-1"
}

resource "null_resource" "cluster" {
  provisioner "local-exec" {
    working_dir = "./awsimages"
    command = "packer build aws-ami.json"
  }
}

data "aws_ami" "goldenimage" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["wezva-packer-*"]
  }

  depends_on = [null_resource.cluster]
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.goldenimage.id
  instance_type = "t2.micro"
}
