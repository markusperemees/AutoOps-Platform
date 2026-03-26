# Dev Environment (`envs/dev`)

This directory is the root Terraform module for the **Development (`dev`)** environment. It ties together the underlying reusable modules (`vpc`, `security`, and `ec2`) to provision the complete AutoOps Platform infrastructure.

## Prerequisites

1. **Remote State Bootstrap**: The `terraform/bootstrap` module must be deployed first. Ensure `backend.tf` is updated with your specific S3 bucket and DynamoDB locking table details.
2. **AWS Credentials**: Ensure valid AWS credentials are set or exported in your environment.
3. **SSH Key Pair**: Ensure the EC2 Key Pair specified in `terraform.tfvars` exists in the AWS region you are deploying to.

## Configuration

Before running this module, create a `terraform.tfvars` file based on the provided example:

```bash
cp terraform.tfvars.example terraform.tfvars
```

Edit `terraform.tfvars` with your specific values. Pay special attention to:
- `aws_region`: The region to deploy into.
- `ssh_cidr`: Set this to your local machine's public IP address (e.g., `203.0.113.50/32`) to allow SSH and Web UI access.
- `key_name`: The exact name of your AWS EC2 SSH Key Pair.

## Deployment

1. Initialize Terraform (downloads providers and configures the backend):
   ```bash
   terraform init
   ```
2. Review the planned infrastructure changes:
   ```bash
   terraform plan -var-file=terraform.tfvars
   ```
3. Apply the configuration:
   ```bash
   terraform apply -var-file=terraform.tfvars
   ```

## CI/CD Intergration
This environment is tracked and deployed via GitHub Actions (`.github/workflows/terraform-ci.yml` and `terraform-cd.yml`). Applying changes directly from your local machine should generally be avoided once the CI/CD pipeline is active.

## Outputs

After a successful deployment, Terraform will output critical information including:
- VPC IDs and Subnet IDs
- Security Group IDs
- Public IP of the Monitoring Node
- Private IPs of the Application Nodes
