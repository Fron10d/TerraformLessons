provider "aws" {
  region = "eu-central-1"
}



data "aws_ami" "latest_amazon_linux" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}


data "aws_ami" "latest_windows_2016" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["Windows_Server-2016-English-Full-Base-*"]
  }

}

/*
resource "aws_instance" "my_webserver_with_latest_ubuntu_ami" {
  ami           = data.aws_ami.latest_ubuntu.id
  instance_type = "t3.micro"
}
*/


output "latest_windows_2016_ami_id" {
  value = data.aws_ami.latest_windows_2016.id
}

output "latest_windows_2016_ami_name" {
  value = data.aws_ami.latest_windows_2016.name
}


output "latest_amazon_linux_ami_id" {
  value = data.aws_ami.latest_amazon_linux.id
}

output "latest_amazon_linux_ami_name" {
  value = data.aws_ami.latest_amazon_linux.name
}
