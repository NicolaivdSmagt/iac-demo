resource "aws_s3_bucket" "dev_website" {  
  bucket_prefix = var.bucket_prefix  
  acl    = "public-read"
}
