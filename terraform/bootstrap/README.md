# Terraform Bootstrap

This directory contains the foundational Terraform code to set up **remote state management** for the rest of the infrastructure. 

Before deploying any environments (like `dev` or `prod`), this bootstrap module must be applied to create the S3 bucket and DynamoDB table used for storing and locking the Terraform state.

## Resources Created
- **S3 Bucket**: Stores the `terraform.tfstate` files securely with Server-Side Encryption (AES256) and versioning enabled. Public access is strictly blocked.
- **DynamoDB Table**: Stores state lock files to prevent concurrent Terraform executions from corrupting the state.

## Deployment Instructions

1. Ensure you have valid AWS credentials configured (e.g., `aws configure` or export `AWS_PROFILE`).
2. Initialize Terraform:
   ```bash
   terraform init
   ```
3. Apply the bootstrap configuration. You will need to provide a globally unique S3 bucket name:
   ```bash
   terraform apply -var="bucket_name=my-globally-unique-autoops-state-bucket"
   ```
   *Note: DynamoDB table will automatically be named `<bucket_name>-lock`.*

4. Once applied, you can retrieve the exact names created and use them in the `backend.tf` files for your actual environments (e.g., `envs/dev/backend.tf`).

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| `bucket_name` | Globally unique name for the S3 state bucket | `string` | yes |
