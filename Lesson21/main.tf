provider "aws" {
  region = "eu-central-1"
}


resource "null_resource" "command1" {
  provisioner "local-exec" {
    command = "echo Terraform START: $(date) >> log.txt"
  }
}



resource "null_resource" "command2" {
  provisioner "local-exec" {
    command = "ping -c 5 www.google.com"
  }
}


resource "null_resource" "command3" {
  provisioner "local-exec" {
    command     = "print('Hello!')"
    interpreter = ["python", "-c"]
  }
}


resource "null_resource" "command4" {
  provisioner "local-exec" {
    command = "echo $NAME1 $NAME2 $NAME3 >> names.txt"
    environment = {
      NAME1 = "1"
      NAME2 = "2"
      NAME3 = "3"
    }
  }
}


resource "aws_instance" "myserver" {
  ami           = "ami-08a9b721ecc5b0a53"
  instance_type = "t3.micro"
  provisioner "local-exec" {
    command = "echo Hello from AWS Instance Creations!"
  }
}


resource "null_resource" "command6" {
  provisioner "local-exec" {
    command = "echo Terraform END: $(date) >> log.txt"
  }
  depends_on = [null_resource.command1, null_resource.command2, null_resource.command3, null_resource.command4, aws_instance.myserver]
}