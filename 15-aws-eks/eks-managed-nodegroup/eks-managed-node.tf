# Remote state 

data "terraform_remote_state" "eks_cluster" {
  backend = "local"  # or s3 or other, depending on your setup
  config = {
    path = "../terraform.tfstate"  # Adjust path or S3 settings as per backend
  }
}

resource "aws_eks_node_group" "eks_noregroup" {
  cluster_name    = data.terraform_remote_state.eks_cluster.outputs.eks_name
  node_group_name = "eks-node-group"
  node_role_arn   = aws_iam_role.eks_worker_node_role.arn
  subnet_ids      = data.terraform_remote_state.eks_cluster.outputs.public_subnets
  

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 2
  }

  update_config {
    max_unavailable = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
#   depends_on = [
#     data.aws_iam_policy.EC2PullImage.arn,
#     data.aws_iam_policy.EKSWorkerNodePolicy.arn,
#     data.aws_iam_policy.CNI_Policy.arn,
#     data.aws_iam_policy.AmazonEC2ContainerRegistryReadOnly.arn
#   ]
}
