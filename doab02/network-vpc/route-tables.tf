# Public Route Table for Apache Layer
resource "aws_route_table" "web_public" {
  vpc_id = aws_vpc.cloudlab.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = merge(
      {
    Name = "${var.PROJECT_NAME}_RT_WEB_PUBLIC"
  }
  )
}

# Private Route Table for Data Layer
resource "aws_route_table" "data_private" {
  vpc_id = aws_vpc.cloudlab.id
  tags = merge(
      {
    Name = "${var.PROJECT_NAME}_RT_DATA_PRIVATE"
  }
  )
}

# Route Table association with WEB Layer public subnets
resource "aws_route_table_association" "to_WEB_LAYER_CIDR_BLOCK_PUBLIC01" {
  subnet_id      = aws_subnet.WEB_LAYER_CIDR_BLOCK_PUBLIC01.id
  route_table_id = aws_route_table.web_public.id
}
resource "aws_route_table_association" "to_WEB_LAYER_CIDR_BLOCK_PUBLIC02" {
  subnet_id      = aws_subnet.WEB_LAYER_CIDR_BLOCK_PUBLIC02.id
  route_table_id = aws_route_table.web_public.id
}

# Route table association with DATA Layer private subnets
resource "aws_route_table_association" "to_DATA_LAYER_CIDR_BLOCK_PRIVATE01" {
  subnet_id      = aws_subnet.DATA_LAYER_CIDR_BLOCK_PRIVATE01.id
  route_table_id = aws_route_table.data_private.id
}

resource "aws_route_table_association" "to_DATA_LAYER_CIDR_BLOCK_PRIVATE02" {
  subnet_id      = aws_subnet.DATA_LAYER_CIDR_BLOCK_PRIVATE02.id
  route_table_id = aws_route_table.data_private.id
}

