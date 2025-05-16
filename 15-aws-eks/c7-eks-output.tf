output "eks_name" {
  value = module.devops_eks.cluster_name
}

output "public_subnets" {
  value = module.eks_vpc.public_subnets
}
