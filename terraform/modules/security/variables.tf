variable "project_name" {
  description = "Project name used for naming resources."
  type        = string
}

variable "environment" {
  description = "Environment name used for naming and tags."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where security groups will be created."
  type        = string
}

variable "ssh_cidr" {
  description = "CIDR block allowed to access the instance over SSH."
  type        = string
}
