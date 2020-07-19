# Create Custom VPC for ARTIFACTORY
resource "aws_vpc" "cloudlab-vpc" {
  cidr_block       = var.VPC_CIDR_BLOCK
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  tags = merge(
      {
    Name = "cloudlab-vpc"
    }
  )
}

# Create Internet Gateway
resource "aws_internet_gateway" "cloudlab-igw" {
  vpc_id = aws_vpc.cloudlab-vpc.id
  tags = merge(
      {
    Name = "cloudlab-IGW"
  }
  )
}
