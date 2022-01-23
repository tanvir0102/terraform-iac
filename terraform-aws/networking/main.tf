# --- networking/main.tf --- 

data "aws_availability_zones" "available" {}

resource "aws_vpc" "devcloud_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "devcloud_vpc"
  }
}

resource "aws_internet_gateway" "devcloud_internet_gateway" {
  vpc_id = aws_vpc.devcloud_vpc.id
  tags = {
    Name = "devcloud_igw"
  }
}


resource "aws_subnet" "devcloud_public_subnet" {
  count                   = length(var.public_cidrs)
  vpc_id                  = aws_vpc.devcloud_vpc.id
  cidr_block              = var.public_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  tags = {
    Name = "devcloud_public_${count.index + 1}"
  }
}
resource "aws_route_table" "devcloud_public_rt" {
  vpc_id = aws_vpc.devcloud_vpc.id
  tags = {
    Name = "devcloud_public"
  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.devcloud_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.devcloud_internet_gateway.id
}

resource "aws_route_table_association" "devcloud_public_assoc" {
  count = length(var.public_cidrs)
  subnet_id = aws_subnet.devcloud_public_subnet.*.id[count.index]
  route_table_id = aws_route_table.devcloud_public_rt.id
}

resource "aws_subnet" "devcloud_private_subnet" {
  count             = length(var.private_cidrs)
  vpc_id            = aws_vpc.devcloud_vpc.id
  cidr_block        = var.private_cidrs[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = {
    Name = "devcloud_private_${count.index + 1}"
  }
}

resource "aws_route_table" "devcloud_private_rt" {
  vpc_id = aws_vpc.devcloud_vpc.id
  tags = {
    Name = "devcloud_priavte"
  }
}

resource "aws_route_table_association" "devcloud_private_assoc" {
  count = length(var.private_cidrs)
  subnet_id = aws_subnet.devcloud_private_subnet.*.id[count.index]
  route_table_id = aws_route_table.devcloud_private_rt.id
}


# Security Groups
resource "aws_security_group" "devcloud_comsg" {
  name = "devcloud_puclic_sg"
  description = "Security Group for Public Access"
  vpc_id = aws_vpc.devcloud_vpc.id
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}