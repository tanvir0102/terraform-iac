resource "aws_security_group" "webapp_sg" {

  name = "${var.PROJECT_NAME}_WEBAPP_SG"
  description = "Created by DevOps Team"
  vpc_id      = var.AWS_VPC_ID

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${var.SSH_CIDR_JUMP_HOST}"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["${var.SSH_CIDR_JUMP_HOST}"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    {
    Name = "${var.PROJECT_NAME}_WEBAPP_SG"
  }
  )
}
