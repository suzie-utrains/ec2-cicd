provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "web_server" {
  ami           = var.ami_id            # AMI ID, such as an Amazon Linux 2 AMI
  instance_type = var.instance_type
  key_name      = var.key_name          # SSH key for access if needed

  # User data script to install Apache and set up the webpage
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "${var.welcome_message}" > /var/www/html/index.html
              EOF

  tags = {
    Name = "ApacheWebServer"
  }
}

# Security Group to allow HTTP access
resource "aws_security_group" "web_sg" {
  name        = "allow_http"
  description = "Allow HTTP inbound traffic"

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

# Attach the security group to the EC2 instance
resource "aws_network_interface_sg_attachment" "web_sg_attachment" {
  security_group_id    = aws_security_group.web_sg.id
  network_interface_id = aws_instance.web_server.primary_network_interface_id
}
