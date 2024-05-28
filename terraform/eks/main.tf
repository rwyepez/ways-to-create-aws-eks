resource "aws_eks_cluster" "my_cluster" {
  name     = var.cluster_name
  role_arn = var.eks_role_arn

  vpc_config {
    subnet_ids = var.public_subnets
  }
}

resource "aws_eks_node_group" "my_node_group" {
  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = "standard-workers"
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.public_subnets

  scaling_config {
    desired_size = var.desired_capacity
    max_size     = var.max_size
    min_size     = var.min_size
  }

  instance_types = var.node_instance_type

  depends_on = [
    aws_eks_cluster.my_cluster
  ]
}


