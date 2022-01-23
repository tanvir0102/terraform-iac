resource "aws_security_group" "bastion_sg" {

  name = "${var.PROJECT_NAME}_BASTION_SG"
  description = "Created by DevOps Team"
  vpc_id      = var.AWS_VPC_ID

  ingress {
    from_port = 22
    to_port = 22
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
    Name = "${var.PROJECT_NAME}_BASTION_SG"
  }
  )
}