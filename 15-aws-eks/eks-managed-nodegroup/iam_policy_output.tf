output "EKSManagedNodeGroupOutput" {
  value = data.aws_iam_policy.EKSWorkerNodePolicy.arn
}

output "CNI_Policy" {
  value = data.aws_iam_policy.CNI_Policy.arn
}

output "AmazonEC2ContainerRegistryReadOnly" {
  value = data.aws_iam_policy.AmazonEC2ContainerRegistryReadOnly.arn
}

