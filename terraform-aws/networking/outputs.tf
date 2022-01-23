# --- networking/output.tf ---
output "vpc_id" {
  value = aws_vpc.devcloud_vpc.id
}