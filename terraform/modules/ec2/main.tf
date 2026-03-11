resource "aws_instance" "monitoring_instance" {
  ami                         = var.monitoring_instance_ami
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
  count                       = var.app_instance_count

  ami                         = var.app_instance_ami
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
