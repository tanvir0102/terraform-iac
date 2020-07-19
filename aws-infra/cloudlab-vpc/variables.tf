# Project wide variable
variable "PROJECT_NAME" {}

# Varibles for the Providers
variable "AWS_REGION" {}

# VPC Variables
variable "VPC_CIDR_BLOCK" {}
variable "WEB_LAYER_CIDR_BLOCK_PUBLIC01" {}
variable "WEB_LAYER_CIDR_BLOCK_PUBLIC02" {}
variable "APP_LAYER_CIDR_BLOCK_PRIVATE01" {}
variable "APP_LAYER_CIDR_BLOCK_PRIVATE02" {}
variable "DATA_LAYER_CIDR_BLOCK_PRIVATE01" {}
variable "DATA_LAYER_CIDR_BLOCK_PRIVATE02" {}