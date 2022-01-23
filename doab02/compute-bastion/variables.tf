# Project wide variable
variable "PROJECT_NAME" {}

# Varibles for the Providers
variable "AWS_REGION" {}

# VPC Variables
variable "AWS_VPC_ID" {}
variable "SSH_CIDR_JUMP_HOST" {}
variable "AWS_AMI_ID" {}
variable "BASTION_EC2_PRIVATE_IP" {}
variable "BASTION_INSTANCE_TYPE" {}
variable "CloudLab_WEB_PUBLIC01" {}
variable "PEM_KEY" {}