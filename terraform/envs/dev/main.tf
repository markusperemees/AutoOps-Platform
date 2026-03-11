module "vpc" {
  source = "../../modules/vpc"

  project_name        = var.project_name
  environment         = var.environment
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}

module "security" {
  source = "../../modules/security"

  project_name        = var.project_name
  environment         = var.environment
  vpc_id              = module.vpc.vpc_id
  ssh_cidr            = var.ssh_cidr
}

module "ec2" {
  source = "../../modules/ec2"

  project_name             = var.project_name
  environment              = var.environment
  monitoring_instance_ami  = var.monitoring_instance_ami
  monitoring_instance_type = var.monitoring_instance_type
  public_subnet_id         = module.vpc.public_subnet_id
  monitoring_sg_id         = module.security.monitoring_sg_id
  app_instance_ami         = var.app_instance_ami
  app_instance_type        = var.app_instance_type
  private_subnet_id        = module.vpc.private_subnet_id
  app_sg_id                = module.security.app_sg_id
  app_instance_count       = var.app_instance_count
}
