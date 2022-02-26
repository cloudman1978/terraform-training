terraform {
  required_version = "~>0.13"
}

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "tfstate" {
  bucket = var.bucket_name
  acl    = "private"
  
  # this is only for the demo in order for us
  # to be able to destroy a non-empty bucket
  force_destroy = true

  versioning {
    enabled = true
  }

  # we will desrtoy this bucket in the end, but in 
  # order to avoid destroying it, uncomment the next block:
  # lifecycle {
  #  prevent_destroy = true
  # }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Terraform = "true"
  }
}

resource "aws_s3_bucket_public_access_block" "default" {
  bucket                  = aws_s3_bucket.tfstate.id
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

resource "aws_dynamodb_table" "tfstate_lock" {
  name = var.dynamo_table_name
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S" # Attribute type, which must be a scalar type: (S)tring, (N)umber or (B)inary data
  }

  tags = {
    Terraform = "true"
  }
}