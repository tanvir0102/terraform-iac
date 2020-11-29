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
