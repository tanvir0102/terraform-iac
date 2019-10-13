
resource "aws_instance" "firstdemoinstance" {
  ami = "ami-00eb20669e0990cb4"
  instance_type = "t2.micro"
  tags {
    Name = "demoinstance"
  }
}
