locals {
  is_monitoring_ami_id = can(regex("^ami-[a-z0-9]+$", var.monitoring_instance_ami))
  is_app_ami_id        = can(regex("^ami-[a-z0-9]+$", var.app_instance_ami))

  monitoring_ami_parameter_name = replace(var.monitoring_instance_ami, "resolve:ssm:", "")
  app_ami_parameter_name        = replace(var.app_instance_ami, "resolve:ssm:", "")
}

data "aws_ssm_parameter" "monitoring_ami" {
  count = local.is_monitoring_ami_id ? 0 : 1
  name  = local.monitoring_ami_parameter_name
}

data "aws_ssm_parameter" "app_ami" {
  count = local.is_app_ami_id ? 0 : 1
  name  = local.app_ami_parameter_name
}

resource "aws_instance" "monitoring_instance" {
  ami                         = local.is_monitoring_ami_id ? var.monitoring_instance_ami : data.aws_ssm_parameter.monitoring_ami[0].value
  instance_type               = var.monitoring_instance_type
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [var.monitoring_sg_id]
  associate_public_ip_address = true

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  root_block_device {
    encrypted             = true
    volume_type           = "gp3"
    delete_on_termination = true
  }

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-${var.environment}-monitoring-instance"
  })
}

resource "aws_instance" "app_instance" {
  count = var.app_instance_count

  ami                         = local.is_app_ami_id ? var.app_instance_ami : data.aws_ssm_parameter.app_ami[0].value
  instance_type               = var.app_instance_type
  subnet_id                   = var.private_subnet_id
  vpc_security_group_ids      = [var.app_sg_id]
  associate_public_ip_address = false

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  root_block_device {
    encrypted             = true
    volume_type           = "gp3"
    delete_on_termination = true
  }

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-${var.environment}-app-instance-${count.index + 1}"
  })
}
