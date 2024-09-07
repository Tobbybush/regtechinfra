variable "region" {
  description = "The AWS region to create resources in"
  default     = "us-west-2"
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  default     = "regtech-app-eks-cluster"
}
