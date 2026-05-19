provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "storage" {
  bucket = var.bucket_name
  force_destroy = true
  tags = {
    project = var.project_id
  }

}

resource "aws_s3_bucket_public_access_block" "private_bucket" {
  bucket = aws_s3_bucket.storage.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}