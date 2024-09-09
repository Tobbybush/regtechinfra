variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table for Terraform state locking."
  type        = string
  default     = "terraform-state-locks"
}

# Variable for the environment (dev, prod, stage)
variable "environment" {
  description = "The environment in which resources are deployed (e.g., dev, stage, prod)."
  type        = string
  default     = "default"
}
