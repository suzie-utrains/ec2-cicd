output "s3_bucket_name" {
  description = "The name of the S3 bucket for Terraform state storage"
  value       = aws_s3_bucket.terraform_state_bucket.id
}

output "dynamodb_table_name" {
  description = "The name of the DynamoDB table for Terraform state locking"
  value       = aws_dynamodb_table.terraform_lock_table.name
}
