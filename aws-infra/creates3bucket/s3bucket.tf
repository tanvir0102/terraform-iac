resource "aws_s3_bucket" "terraform-s3" {
  bucket = "terraform-s3-testuniquesb"
  versioning {
    enabled = true
  }
  lifecycle {
    prevent_destroy = false
  }
  tags {
   Name = "S3 bucket for demo"
  }
}
