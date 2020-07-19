# Define the provider
provider "aws" {
  version = "2.54"
  shared_credentials_file = "~/.aws/credentials"
  profile = "CLOUD-LAB"
  region = var.AWS_REGION # The region in where you want to Operate
}
