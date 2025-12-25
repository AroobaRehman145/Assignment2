variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
  validation {
    condition     = can(cidrnetmask(var.vpc_cidr_block))
    error_message = "The vpc_cidr_block must be a valid CIDR."
  }
}
variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.10.0/24"
  validation {
    condition     = can(cidrnetmask(var.subnet_cidr_block))
    error_message = "The subnet_cidr_block must be a valid CIDR."
  }
}

variable "availability_zone" {
  description = "The AZ where resources will be deployed"
  type        = string
}

variable "env_prefix" {
  description = "Prefix for naming resources (e.g., dev, prod)"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "public_key" {
  description = "Path to the public SSH key"
  type        = string
}

variable "private_key" {
  description = "Path to the private SSH key"
  type        = string
}

variable "backend_servers" {
  description = "List of backend server objects"
  type = list(object({
    name        = string
    script_path = string
  }))
}
variable "my_ip" {
  type    = string
  default = "0.0.0.0/0"
}
variable "public_key_path" {
  description = "Path to the public ssh key"
  type        = string
  default     = "~/.ssh/id_rsa.pub" # Or wherever your key is located
}