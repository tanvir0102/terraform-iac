# S3 backed
terraform {
  backend "s3" {
    bucket = "terraform-statefiles-29112020"
    key    = "vpc-statefile/terraform.tfstate"
    region = "us-east-1"
  }
}


# Create Custom VPC for LAB
resource "aws_vpc" "cloudlab" {
  cidr_block       = var.VPC_CIDR_BLOCK
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  tags = merge(
      {
    Name = "${var.PROJECT_NAME}_VPC"
    }
  )
}

# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.cloudlab.id
  tags = merge(
      {
    Name = "${var.PROJECT_NAME}_IGW"
  }
  )
}
