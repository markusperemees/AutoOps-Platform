variable "aws_region" {
  description = "AWS region for the dev environment."
  type        = string
}

variable "project_name" {
  description = "Project name used for resource naming."
  type        = string
}

variable "environment" {
  description = "Environment name used for naming and tags."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet."
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet."
  type        = string
}

variable "ssh_cidr" {
  description = "CIDR block allowed to access the instance over SSH."
  type        = string
}

variable "monitoring_instance_ami" {
  description = "EC2 AMI ID or SSM parameter path for the monitoring instance image."
  type        = string
}

variable "monitoring_instance_type" {
  description = "EC2 instance type for the monitoring server."
  type        = string
}

variable "app_instance_ami" {
  description = "EC2 AMI ID or SSM parameter path for the app instance image."
  type        = string
}

variable "app_instance_type" {
  description = "EC2 instance type for app servers."
  type        = string
}

variable "app_instance_count" {
  description = "Number of app EC2 instances to create."
  type        = number
}
