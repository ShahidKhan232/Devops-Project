variable "cluster_name" {
  default = "eks-2048-cluster"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "node_instance_type" {
  default = "t3.medium"
}

variable "desired_capacity" {
  default = 1
}

variable "max_capacity" {
  default = 1
}

variable "min_capacity" {
  default = 1
}

variable "allowed_azs" {
  description = "List of allowed availability zones for EKS control plane."
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1f"]
}
