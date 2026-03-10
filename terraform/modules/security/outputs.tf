output "monitoring_sg_id" {
  description = "ID of the monitoring security group."
  value       = aws_security_group.monitoring_sg.id
}

output "app_sg_id" {
  description = "ID of the application security group."
  value       = aws_security_group.app_sg.id
}
