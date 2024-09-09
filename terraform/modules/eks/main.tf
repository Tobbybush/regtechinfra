module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "${var.environment}-eks-cluster"
  cluster_version = "1.21"
  subnets         = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

  node_groups = {
    eks_nodes = {
      desired_capacity = var.desired_capacity
      max_capacity     = var.max_capacity
      min_capacity     = var.min_capacity

      instance_type = var.instance_type
      key_name      = var.key_name
    }
  }
}
