#Web Application EC2 for Dev Environment
resource "aws_instance" "webapp_ec2" {

  ami = var.AWS_AMI_ID
  private_ip = var.WEBAPP_EC2_PRIVATE_IP
  instance_type = var.WEBAPP_INSTANCE_TYPE
  key_name = var.PEM_KEY
  subnet_id = var.CloudLab_WEB_PUBLIC01
  # user_data = file("${var.USER_DATA_FOR_JUMPHOST}")

  vpc_security_group_ids = [
    "${aws_security_group.webapp_sg1.id}",
        ]

  associate_public_ip_address = true
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
              EOF
              
  tags = merge(
    {
    Name = "${var.PROJECT_NAME}_WEBAPP"
  }
  )
}

output "public_ip" {
  description = "Public IP of Bastion Host"
  value       = aws_instance.webapp_ec2.public_ip
}