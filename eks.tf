module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = "${var.project}-eks-cluster"
  kubernetes_version = "1.28"  # correct argument for v21

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    ng_default = {
      desired_size   = 2
      max_size       = 3
      min_size       = 1
      instance_types = var.node_instance_types
    }
  }

  endpoint_private_access = true
  endpoint_public_access  = true

  tags = {
    Project = var.project
  }
}
