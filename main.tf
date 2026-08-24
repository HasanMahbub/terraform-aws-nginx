resource "aws_security_group" "sg" {
  name        = "${var.server_name}-sg"
  description = "Allow http inbound traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.linux.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg.id]

  # Tailored DNF script formatting specifically for Amazon Linux 2023 systems
  user_data = <<-EOF
              #!/bin/bash
              sudo dnf update -y
              sudo dnf install nginx -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
              echo "<h1>Nginx deployed via multi-file Terraform!</h1>" | sudo tee /usr/share/nginx/html/index.html
              EOF

  tags = {
    Name = var.server_name
  }

}