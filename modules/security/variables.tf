variable "vpc_id" {
  description = "VPC ID where the security groups will be created"
}

variable "env_prefix" {
  description = "Prefix for resource naming"
}

variable "my_ip" {
  description = "Your public IP address for SSH access (e.g., 1.2.3.4/32)"
  type        = string
  default     = "0.0.0.0/0" # Change this in terraform.tfvars for security
}