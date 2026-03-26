# VPC Module

This module provisions the foundational networking infrastructure for the AutoOps Platform.

## Resources Created
- **VPC** with DNS support and hostnames enabled
- **Internet Gateway** for external access
- **Public Subnet** (auto-assigns public IPs)
- **Private Subnet**
- **NAT Gateway** (with Elastic IP) for private subnet outbound traffic
- Routing tables and associations

## Requirements
- Terraform >= 1.0
- AWS Provider >= 5.0

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| `project_name` | Name of the project used for naming resources | `string` | yes |
| `environment` | Environment name (e.g., dev, prod) | `string` | yes |
| `vpc_cidr` | CIDR block for the VPC | `string` | yes |
| `public_subnet_cidr`| CIDR block for the public subnet | `string` | yes |
| `private_subnet_cidr`| CIDR block for the private subnet | `string` | yes |

## Outputs

| Name | Description |
|------|-------------|
| `vpc_id` | The ID of the VPC |
| `public_subnet_id` | The ID of the public subnet |
| `private_subnet_id` | The ID of the private subnet |
| `internet_gateway_id`| The ID of the Internet Gateway |
| `nat_gateway_id` | The ID of the NAT Gateway |
