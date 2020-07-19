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

# ELastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {
  vpc      = true
  depends_on = [aws_internet_gateway.igw]
}

# NAT gateway for private ip address
resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.WEB_LAYER_CIDR_BLOCK_PUBLIC02.id
  depends_on = [aws_internet_gateway.igw]

  tags = merge(
      {
    Name = "${var.PROJECT_NAME}_NAT_GATEWAY"
  }
  )
}
