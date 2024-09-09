output "vpc_id" {
  description = "The VPC ID"
  value       = module.vpc.vpc_id
}

output "eks_cluster_endpoint" {
  description = "EKS Cluster Endpoint"
  value       = data.aws_eks_cluster.eks_cluster.endpoint
}

output "node_instance_role" {
  description = "IAM role for EKS worker nodes"
  value       = module.eks.node_groups.eks_nodes.iam_role_arn
}