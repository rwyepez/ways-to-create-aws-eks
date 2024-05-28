variable "cluster_name" {
  description = "The name of the EKS cluster"
  default     = "my-cluster"
}

variable "node_instance_type" {
  description = "EC2 instance type for the nodes"
  default     = "t3.medium"
}

variable "desired_capacity" {
  description = "Desired number of worker nodes"
  default     = 1
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  default     = 1
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  default     = 1
}
