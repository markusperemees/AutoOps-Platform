# EC2 Module

This module provisions the compute resources for the AutoOps Platform, splitting them into a central monitoring node and variable application nodes.

## Resources Created
- **Monitoring Instance**: Placed in the public subnet, acting as the host for the unified Prometheus/Grafana stack and as a pseudo-bastion for app nodes.
- **Application Instances**: Placed in the private subnet, configured via count. Hosts the actual application and local metric exporters.

## Requirements
- Terraform >= 1.0
- AWS Provider >= 5.0

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| `project_name` | Name of the project used for naming resources | `string` | yes |
| `environment` | Environment name (e.g., dev, prod) | `string` | yes |
| `monitoring_instance_ami` | AMI ID for the monitoring instance | `string` | yes |
| `monitoring_instance_type`| EC2 instance type for the monitoring server | `string` | yes |
| `public_subnet_id` | The ID of the public subnet where the monitoring node resides | `string` | yes |
| `monitoring_sg_id` | Security Group ID applied to the monitoring instance | `string` | yes |
| `app_instance_ami` | AMI ID for the application instances | `string` | yes |
| `app_instance_type`| EC2 instance type for the app servers | `string` | yes |
| `private_subnet_id` | The ID of the private subnet where the app instances reside | `string` | yes |
| `app_sg_id` | Security Group ID applied to the application instances | `string` | yes |
| `app_instance_count`| Number of application instances to create | `number` | yes |
| `key_name` | EC2 SSH key pair name used for access | `string` | yes |

## Outputs

| Name | Description |
|------|-------------|
| `monitoring_instance_id` | ID of the monitoring EC2 instance |
| `monitoring_instance_public_ip` | Public IP of the monitoring EC2 instance |
| `monitoring_instance_private_ip`| Private IP of the monitoring EC2 instance |
| `app_instance_ids` | IDs of the application EC2 instances |
| `app_instance_private_ips` | Private IPs of the application EC2 instances |
