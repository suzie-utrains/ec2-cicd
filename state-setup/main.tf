provider "aws" {
  region = var.aws_region
}

# Create S3 bucket for Terraform state
resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = var.s3_bucket_name
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "TerraformStateBucket"
    Environment = var.environment
  }
}

# Enable server-side encryption for the S3 bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_bucket_encryption" {
  bucket = aws_s3_bucket.terraform_state_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Create DynamoDB table for Terraform state locking
resource "aws_dynamodb_table" "terraform_lock_table" {
  name           = var.dynamodb_table_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "TerraformLockTable"
    Environment = var.environment
  }
}
