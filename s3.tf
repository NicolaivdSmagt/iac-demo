resource "aws_s3_bucket" "prod_website" {  
  bucket_prefix = var.bucket_prefix  
  acl    = "public-read"
}
