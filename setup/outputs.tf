output "instance_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.web_server.public_ip
}

output "website_url" {
  description = "URL to access the Apache web server"
  value       = "http://${aws_instance.web_server.public_ip}"
}
