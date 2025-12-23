resource "aws_s3_bucket" "s3_bucket" {
  bucket = "s3_bucket_example_project"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_bucket_sse" {
  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "versioning_exs3_bucket_sse_versioning" {
  bucket = aws_s3_bucket.s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }

  depends_on = [aws_s3_bucket_server_side_encryption_configuration.s3_bucket_sse]
}

resource "aws_dynamodb_table" "basic_dynamodb_table" {
  name         = "s3_backend_locking_table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}