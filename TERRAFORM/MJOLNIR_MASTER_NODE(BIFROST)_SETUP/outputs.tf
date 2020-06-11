# EC2 Outputs
output "bifrost_arn" {
  value       = aws_instance.bifrost.arn
  description = "The ARN of the Master Node"
}

output "bifrost_id" {
  value       = aws_instance.bifrost.id
  description = "The ID of the Master Node"
}

output "bifrost_dns" {
  value       = aws_instance.bifrost.public_dns
  description = "Public DNS of the Master Node"
}

output "bifrost_ip" {
  value       = aws_instance.bifrost.public_ip
  description = "Public IP of the Master Node"
}

# output bifrost_user_data {
#   value = "\n${data.template_file.bifrost_user_data_file.rendered}"
# }