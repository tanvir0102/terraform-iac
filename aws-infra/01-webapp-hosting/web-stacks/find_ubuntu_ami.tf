data "aws_ami" "linux" {
 most_recent = "true"
 owners = ["137112412989"]
  filter {
  name = "name"
  values = ["amzn-ami-hvm-2018.03.0.20190826-x86_64-gp2"]
  }
 filter {
  name = "virtualization-type"
  values = ["hvm"]
 }
}
output "aws_ami" {
  value = [data.aws_ami.linux.id]
}
