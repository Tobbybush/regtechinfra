variable "environment" {
  type        = string
  description = "Environment name (dev, stage, prod)"
}

variable "desired_capacity" {
  type        = number
  description = "Desired number of worker nodes"
}

variable "max_capacity" {
  type        = number
  description = "Maximum number of worker nodes"
}

variable "min_capacity" {
  type        = number
  description = "Minimum number of worker nodes"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type for worker nodes"
}

variable "key_name" {
  type        = string
  description = "Name of the SSH key to access worker nodes"
}
