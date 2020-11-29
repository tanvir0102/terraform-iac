provider "aws" {
  version = "2.54"
  shared_credentials_file = "~/.aws/credentials"
  profile = "cloud-lab"
  region = var.AWS_REGION # The region in where you want to Operate
}
