provider "aws" {
}


resource "aws_instance" "my_server_web" {
  ami                    = "ami-98908709870987"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.my_webserver.id]

  tags = {
    "Name" = "Server-Web"
  }
  // do not create until DB comes up
  depends_on = [
    aws_instance.my_server_db, aws_instance.my_server_app
  ]
}

resource "aws_instance" "my_server_db" {
  ami                    = "ami-98908709870987"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.my_webserver.id]

  tags = {
    "Name" = "Server-DB"
  }
}

resource "aws_instance" "my_server_app" {
  ami                    = "ami-98908709870987"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.my_webserver.id]

  tags = {
    "Name" = "Server-Application"
  }
  // do not create until DB comes up
  depends_on = [
    aws_instance.my_server_db
  ]
}

resource "aws_security_group" "my_webserver" {
  name = "My Security Group"

  dynamic "ingress" {
    for_each = ["80", "443"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "My Security Group"
  }

}
