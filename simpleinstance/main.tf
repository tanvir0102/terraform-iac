
resource "aws_instance" "firstdemoinstance" {
  count = 3
  ami = "ami-00eb20669e0990cb4"
  instance_type = "t2.micro"
  tags {
    Name = "demoinstance-${count.index}"
  }
}
