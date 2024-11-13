variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "us-east-2"
}

variable "ami_id" {
  description = "The AMI ID for the instance (Amazon Linux 2 recommended)"
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The name of the SSH key pair to use"
  default     = "suzie-ec2-key"
  type        = string
}

variable "welcome_message" {
  description = "The welcome message to display on the Apache web server"
  type        = string
  default     = "<h1>Welcome to my Apache Web Server</h1>"
}
