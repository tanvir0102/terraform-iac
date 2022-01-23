#Web Application EC2 for Dev Environment
resource "aws_instance" "bastion_ec2" {

  ami = var.AWS_AMI_ID
  private_ip = var.BASTION_EC2_PRIVATE_IP
  instance_type = var.BASTION_INSTANCE_TYPE
  key_name = var.PEM_KEY
  subnet_id = var.CloudLab_WEB_PUBLIC01

  vpc_security_group_ids = [
    "${aws_security_group.bastion_sg.id}",
        ]
  associate_public_ip_address = true
  
  tags = merge(
    {
    Name = "${var.PROJECT_NAME}_BASTION"
  }
  )
}

output "public_ip" {
  description = "Public IP of Bastion Host"
  value       = aws_instance.bastion_ec2.public_ip
}