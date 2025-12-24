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

module "create_pem" {
  source = "./modules/create_pem"
  key_name = var.root_key_name
  key_path = var.root_key_path
}

module "create_sg" {
  source = "./modules/create_sg"
  sg_name = var.root_sg_name
}

module "create_ec2" {
  source = "./modules/create_ec2"
  instance_type = var.root_instance_type
  pem_key_name = module.create_pem.pem_key
  sg_id = module.create_sg.sg_id
}

module "file_provisioner" {
  source = "./modules/file-provisioner"

  ec2_public_ip     = module.create_ec2.public_ip
  ec2_username      = var.root_ec2_username
  ec2_pem           = var.root_key_path
  source_path       = var.root_source_path
  destination_path  = var.root_destination_path
}

module "remote_exec" {
  source = "./modules/remote-exec"
  ec2_public_ip   = module.create_ec2.public_ip
  ec2_username    = var.root_ec2_username
  ec2_pem         = var.root_key_path
  inline_commands = var.root_inline_commands
}