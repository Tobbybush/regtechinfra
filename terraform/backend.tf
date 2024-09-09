terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "terraform/${var.environment}/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-locks"
  }
}
