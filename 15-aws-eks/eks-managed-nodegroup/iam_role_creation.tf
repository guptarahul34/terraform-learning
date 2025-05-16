# These are policy data source block

data "aws_iam_policy" "EKSWorkerNodePolicy" {
  name = "AmazonEKSWorkerNodePolicy"
}


data "aws_iam_policy" "CNI_Policy" {
  name = "AmazonEKS_CNI_Policy"
}

data "aws_iam_policy" "AmazonEC2ContainerRegistryReadOnly" {
  name = "AmazonEC2ContainerRegistryReadOnly"
}

# IAM Role Creations

# resource "aws_iam_role" "eks_worker_node_role" {
#   name = "EKSWorkerNodeIAMROLE"

#   # Terraform's "jsonencode" function converts a
#   # Terraform expression result to valid JSON syntax.
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Sid    = ""
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#       },
#     ]
#   })
  
#   managed_policy_arns = [ data.aws_iam_policy.EKSWorkerNodePolicy.arn, data.aws_iam_policy.CNI_Policy.arn, data.aws_iam_policy.AmazonEC2ContainerRegistryReadOnly.arn ]

#   tags = {
#     Name = "EKS-Worker Node Policy"
#   }
# }


resource "aws_iam_role" "eks_worker_node_role" {
  name = "EKSWorkerNodeIAMROLE"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

# Attach EKS Worker Node Policy
resource "aws_iam_role_policy_attachment" "eks_worker_node_policy" {
  role       = aws_iam_role.eks_worker_node_role.name
  policy_arn = data.aws_iam_policy.EKSWorkerNodePolicy.arn
}

# Attach CNI Policy
resource "aws_iam_role_policy_attachment" "cni_policy" {
  role       = aws_iam_role.eks_worker_node_role.name
  policy_arn = data.aws_iam_policy.CNI_Policy.arn
}

# Attach Amazon EC2 Container Registry ReadOnly Policy
resource "aws_iam_role_policy_attachment" "amazon_ec2_registry_read_only" {
  role       = aws_iam_role.eks_worker_node_role.name
  policy_arn = data.aws_iam_policy.AmazonEC2ContainerRegistryReadOnly.arn
}


