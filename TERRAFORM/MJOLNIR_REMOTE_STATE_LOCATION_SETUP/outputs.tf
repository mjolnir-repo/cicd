output "remote_state_location_arn" {
  value       = aws_s3_bucket.remote_state_location.arn
  description = "The ARN of the S3 bucket"
}

output "remote_state_location_name" {
  value       = aws_s3_bucket.remote_state_location.id
  description = "Name of the S3 bucket"
}

output "dynamodb_terraform_state_lock_collection" {
  value       = aws_dynamodb_table.dynamodb_terraform_state_lock.id
  description = "Name of the state-lock dynamoDB table"
}