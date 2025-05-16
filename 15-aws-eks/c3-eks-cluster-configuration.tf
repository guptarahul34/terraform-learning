module "devops_eks" {
  depends_on = [ module.eks_vpc ]
  source  = "terraform-aws-modules/eks/aws"
  version = "20.36.0"
    
  cluster_name    = local.cluster_name
  cluster_version = "1.32"

  # EKS Addons
  cluster_addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
  }

  vpc_id     = module.eks_vpc.vpc_id
  subnet_ids = module.eks_vpc.public_subnets
  cluster_endpoint_public_access = true
  cluster_encryption_config = {}
  # create_kms_key  = false

  # eks_managed_node_groups = {
  #   eks_managed_nodes = {
  #     # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
  #     instance_types = ["t2.medium"]
  #     ami_type       = "AL2023_x86_64_STANDARD"

  #     min_size = 1
  #     max_size = 3
  #     # This value is ignored after the initial creation
  #     # https://github.com/bryantbiggs/eks-desired-size-hack
  #     desired_size = 1
  #   }
  # }

  tags = local.tags_name
}
