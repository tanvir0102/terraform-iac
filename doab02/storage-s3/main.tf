resource "aws_s3_bucket" "demo-s3-bucket" {
  bucket = "terraform-s3-testuniquesb-112121"
  acl    = "private"
  
  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = false
  }

   tags = {
    Name        = "Bucket for Demo"
    Environment = "LAB"
  }
}