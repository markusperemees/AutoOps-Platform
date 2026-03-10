output "monitoring_instance_id" {
  description = "ID of the monitoring EC2 instance."
  value       = aws_instance.monitoring_instance.id
}

output "monitoring_instance_public_ip" {
  description = "Public IP of the monitoring EC2 instance."
  value       = aws_instance.monitoring_instance.public_ip
}

output "monitoring_instance_private_ip" {
  description = "Private IP of the monitoring EC2 instance."
  value       = aws_instance.monitoring_instance.private_ip
}

output "app_instance_ids" {
  description = "IDs of the application EC2 instances."
  value       = aws_instance.app_instance[*].id
}

output "app_instance_private_ips" {
  description = "Private IPs of the application EC2 instances."
  value       = aws_instance.app_instance[*].private_ip
}
