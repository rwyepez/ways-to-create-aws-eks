variable "public_subnets" {
  description = "List of public subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "cluster_name" {
  type = string
}

variable "eks_role_arn" {
  type = string
}

variable "node_role_arn" {
  type = string
}

variable "desired_capacity" {
  type = number
}

variable "max_size" {
  type = number
}

variable "min_size" {
  type = number
}

variable "node_instance_type" {
  type = list(string)
}
