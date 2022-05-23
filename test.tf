resource "aws_s3_bucket" "test_website" {  
  bucket_prefix = var.bucket_prefix  
  acl    = "public-write"
}
