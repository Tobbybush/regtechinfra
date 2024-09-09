module "vpc" {
  source  = "../shared/modules/vpc"
  environment       = "dev"
  vpc_cidr          = var.vpc_cidr
  availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]
  private_subnets    = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  enable_nat_gateway = true
}

module "eks" {
  source           = "../shared/modules/eks"
  environment      = "prod"
  desired_capacity = 1
  max_capacity     = 2
  min_capacity     = 1
  instance_type    = "t3.small"
  key_name         = "dev-ssh-key"
}
