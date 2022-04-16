resource "aws_instance" "my_ec2" {
    ami = "ami-08e4e35cccc6189f4"
    associate_public_ip_address = false
    instance_type = "t2.micro"
}