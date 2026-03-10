terraform {
  backend "s3" {
    bucket         = "markus-tf-state-123456789"
    key            = "dev/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "markus-tf-state-123456789-lock"
    encrypt        = true
  }
}
