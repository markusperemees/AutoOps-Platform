variable "project_name" {
  description = "Project name used for naming resources."
  type        = string
}

variable "environment" {
  description = "Environment name used for naming and tags."
  type        = string
}

variable "monitoring_instance_ami" {
  description = "EC2 AMI ID for the monitoring instance (ami-...)."
  type        = string
  default     = "ami-0aaa636894689fa47"
}

variable "monitoring_instance_type" {
  description = "EC2 instance type for the server."
  type        = string
  default     = "t3.micro"
}

variable "public_subnet_id" {
  description = "Public subnet ID used for the monitoring instance."
  type        = string
}

variable "monitoring_sg_id" {
  description = "Security group ID for the monitoring instance."
  type        = string
}

variable "app_instance_ami" {
  description = "EC2 AMI ID for the app instance (ami-...)."
  type        = string
  default     = "ami-0aaa636894689fa47"
}

variable "app_instance_type" {
  description = "EC2 instance type for the server."
  type        = string
  default     = "t3.micro"
}

variable "private_subnet_id" {
  description = "Private subnet ID used for the app instance."
  type        = string
}

variable "app_sg_id" {
  description = "Security group ID for the app instance."
  type        = string
}

variable "app_instance_count" {
  description = "Number of app EC2 instances to create."
  type        = number
  default     = 2
}
