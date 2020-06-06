output "remote_state_location_arn" {
  value       = aws_s3_bucket.remote_state_location.arn
  description = "The ARN of the S3 bucket"
}