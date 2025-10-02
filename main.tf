provider "aws" {
  region = var.aws_region
}

resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "example" {
  bucket = "${var.name_prefix}-${random_id.suffix.hex}"
  acl    = "private"
  tags = {
    Name = var.name_prefix
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.example.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket" "example2" {
  bucket = "${var.name_prefix}-${random_id.suffix.hex}"
  acl    = "private"
  tags = {
    Name = var.name_prefix
  }
}

resource "aws_s3_bucket_public_access_block" "example2" {
  bucket = aws_s3_bucket.example.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

