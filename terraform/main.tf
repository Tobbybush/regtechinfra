# Create the VPC
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"
  name    = "regtech-app-vpc"
  cidr    = "10.0.0.0/16"

  azs             = ["us-west-2a", "us-west-2b", "us-west-2c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
}

# Create EKS Cluster
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "regtech-app-eks-cluster"
  cluster_version = "1.21"
  subnets         = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_type = "t3.medium"
      key_name      = "regtech-app-ssh-key"

# Configuration for EBS Encryption
resource "aws_ebs_volume" "app_volume" {
  availability_zone = "us-west-2a"
  size              = 50
  encrypted         = true
  kms_key_id        = aws_kms_key.ebs_key.arn
}

resource "aws_kms_key" "ebs_key" {
  description = "KMS key for encrypting EBS volumes"
  enable_key_rotation = true
}


    }
  }
}

# Outputs to be used in the Kubernetes provider
data "aws_eks_cluster" "eks_cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "eks_auth" {
  name = module.eks.cluster_id
}
