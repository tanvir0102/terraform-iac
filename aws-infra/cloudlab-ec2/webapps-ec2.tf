#Web Application EC2 for Dev Environment
resource "aws_instance" "webapp_ec2" {

  ami = var.AWS_AMI_ID
  private_ip = var.WEBAPP_EC2_PRIVATE_IP
  instance_type = var.WEBAPP_INSTANCE_TYPE
  key_name = var.PEM_KEY
  subnet_id = var.CloudLab_WEB_PUBLIC01
  # user_data = file("${var.USER_DATA_FOR_JUMPHOST}")

  vpc_security_group_ids = [
    "${aws_security_group.webapp_sg.id}",
        ]

  associate_public_ip_address = true
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install apache2 -y
              sudo bash -c 'echo Hello, CloudGuru!!! > /var/www/html/index.html'
              EOF
              
  tags = merge(
    {
    Name = "${var.PROJECT_NAME}_WEBAPP"
  }
  )
}
