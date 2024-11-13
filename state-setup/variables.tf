variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "us-west-2"
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket for storing the Terraform state"
  type        = string
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table for Terraform state locking"
  type        = string
}

variable "environment" {
  description = "Environment tag for resources"
  type        = string
  default     = "dev"
}
