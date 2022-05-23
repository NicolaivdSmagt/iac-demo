resource "aws_s3_bucket" "prod_website" {
  bucket_prefix = var.bucket_prefix
  acl           = "public-read"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "<Provide the ARN of the KMS key>"
        sse_algorithm     = "aws:kms"
      }
    }
  }
}
