output "public_ip" {
  value       = aws_instance.example.public_ip
  description = "The public IP of the web server"
}

output "public_dns" {
  value       = aws_instance.example.public_dns
  description = "The public domain name of the web server"
}

output "user_data" {
  value       = aws_instance.example.user_data
  description = "The user data of the web server"
}
