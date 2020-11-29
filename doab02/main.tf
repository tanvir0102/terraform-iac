resource "aws_instance" "firstdemoinstance" {
  count = 3
  ami = "ami-096fda3c22c1c990a"
  instance_type = "t2.micro"
  tags = merge(
    {
    Name = "demoinstance-${count.index}"
  }
  )
}

