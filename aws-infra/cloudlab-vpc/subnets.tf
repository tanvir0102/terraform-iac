data "aws_availability_zones" "available" {}

# Create Public Subnet - Apache LAYER
resource "aws_subnet" "WEB_LAYER_CIDR_BLOCK_PUBLIC01" {
  vpc_id     = aws_vpc.cloudlab.id
  cidr_block = var.WEB_LAYER_CIDR_BLOCK_PUBLIC01
  availability_zone = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = "true"
  tags = merge(
      {
    Name = "${var.PROJECT_NAME}_WEB_PUBLIC01"
  }
  )
}
resource "aws_subnet" "WEB_LAYER_CIDR_BLOCK_PUBLIC02" {
  vpc_id     = aws_vpc.cloudlab.id
  cidr_block = var.WEB_LAYER_CIDR_BLOCK_PUBLIC02
  availability_zone = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = "true"
  tags = merge(
      {
    Name = "${var.PROJECT_NAME}_WEB_PUBLIC02"
  }
  )
}

# Create Private subnets - Apps Layer
resource "aws_subnet" "APP_LAYER_CIDR_BLOCK_PRIVATE01" {
  vpc_id     = aws_vpc.cloudlab.id
  cidr_block = var.APP_LAYER_CIDR_BLOCK_PRIVATE01
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = merge(
  {
    Name = "${var.PROJECT_NAME}_APP_PRIVATE01"
  }
  )
}

resource "aws_subnet" "APP_LAYER_CIDR_BLOCK_PRIVATE02" {
  vpc_id     = aws_vpc.cloudlab.id
  cidr_block = var.APP_LAYER_CIDR_BLOCK_PRIVATE02
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = merge(
  {
    Name = "${var.PROJECT_NAME}_APP_PRIVATE02"
  }
  )
}

# Create Public Subnet - Data LAYER
resource "aws_subnet" "DATA_LAYER_CIDR_BLOCK_PRIVATE01" {
  vpc_id     = aws_vpc.cloudlab.id
  cidr_block = var.DATA_LAYER_CIDR_BLOCK_PRIVATE01
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = merge(
  {
    Name = "${var.PROJECT_NAME}_DATA_PRIVATE01"
  }
  )
}

resource "aws_subnet" "DATA_LAYER_CIDR_BLOCK_PRIVATE02" {
  vpc_id     = aws_vpc.cloudlab.id
  cidr_block = var.DATA_LAYER_CIDR_BLOCK_PRIVATE02
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = merge(
  {
    Name = "${var.PROJECT_NAME}_DATA_PRIVATE02"
  }
  )
}