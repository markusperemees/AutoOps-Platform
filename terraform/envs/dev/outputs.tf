output "vpc_id" {
  description = "ID of the VPC."
  value       = module.vpc.vpc_id
}

output "public_subnet_id" {
  description = "ID of the public subnet."
  value       = module.vpc.public_subnet_id
}

output "private_subnet_id" {
  description = "ID of the private subnet."
  value       = module.vpc.private_subnet_id
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway."
  value       = module.vpc.internet_gateway_id
}

output "nat_gateway_id" {
  description = "ID of the NAT Gateway."
  value       = module.vpc.nat_gateway_id
}

output "monitoring_sg_id" {
  description = "ID of the monitoring security group."
  value       = module.security.monitoring_sg_id
}

output "app_sg_id" {
  description = "ID of the application security group."
  value       = module.security.app_sg_id
}

output "monitoring_instance_id" {
  description = "ID of the monitoring EC2 instance."
  value       = module.ec2.monitoring_instance_id
}

output "monitoring_instance_public_ip" {
  description = "Public IP of the monitoring EC2 instance."
  value       = module.ec2.monitoring_instance_public_ip
}

output "monitoring_instance_private_ip" {
  description = "Private IP of the monitoring EC2 instance."
  value       = module.ec2.monitoring_instance_private_ip
}

output "app_instance_ids" {
  description = "IDs of the application EC2 instances."
  value       = module.ec2.app_instance_ids
}

output "app_instance_private_ips" {
  description = "Private IPs of the application EC2 instances."
  value       = module.ec2.app_instance_private_ips
}
