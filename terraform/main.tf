module "iam" {
  source = "./iam"
}

module "vpc" {
  source = "./vpc"
}

module "eks" {
  source = "./eks"

  cluster_name       = var.cluster_name
  desired_capacity   = var.desired_capacity
  max_size           = var.min_size
  min_size           = var.max_size
  node_instance_type = var.node_instance_type

  eks_role_arn   = module.iam.eks_cluster_role_arn
  node_role_arn  = module.iam.eks_node_role_arn
  public_subnets = module.vpc.public_subnet_ids
}
