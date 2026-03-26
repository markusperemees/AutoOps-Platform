# Security Module

This module provisions the Security Groups required to control inbound and outbound traffic for the infrastructure instances. 

## Resources Created
- **Monitoring Security Group**: Allows targeted ingress for SSH, Grafana (3000), Prometheus (9090), and Alertmanager (9093) based on a specific CIDR block.
- **App Security Group**: Allows targeted ingress for SSH from a specific CIDR block, and internal access (SSH, application on 5000, Node Exporter, cAdvisor) originating from the Monitoring Security Group. 
- Both groups allow all outbound (egress) traffic.

## Requirements
- Terraform >= 1.0
- AWS Provider >= 5.0

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| `project_name` | Name of the project used for naming resources | `string` | yes |
| `environment` | Environment name (e.g., dev, prod) | `string` | yes |
| `vpc_id` | The ID of the VPC where security groups will be created | `string` | yes |
| `ssh_cidr` | IP/CIDR block allowed to access the instances over SSH (and external web UIs) | `string` | yes |

## Outputs

| Name | Description |
|------|-------------|
| `monitoring_sg_id` | ID of the monitoring security group |
| `app_sg_id` | ID of the application security group |
