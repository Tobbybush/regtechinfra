provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks_cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks_cluster.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks_auth.token
}

data "aws_eks_cluster" "eks_cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "eks_auth" {
  name = module.eks.cluster_id
}
