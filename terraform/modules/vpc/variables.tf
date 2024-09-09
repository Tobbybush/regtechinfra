variable "environment" {
  type        = string
  description = "Environment name (dev, stage, prod)"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnets"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnets"
}

variable "enable_nat_gateway" {
  type        = bool
  description = "Enable NAT gateway"
}
