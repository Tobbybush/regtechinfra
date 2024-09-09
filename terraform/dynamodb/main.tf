# main.tf
resource "aws_dynamodb_table" "terraform_locks" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"  # Billing mode for on-demand pricing
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "Terraform Lock Table"
    Environment = var.environment
  }
}

# Output the name of the DynamoDB table
output "dynamodb_table_name" {
  value = aws_dynamodb_table.terraform_locks.name
}
