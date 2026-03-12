#tfsec:ignore:aws-ec2-no-public-egress-sgr:exp:2026-06-30
resource "aws_security_group" "monitoring_sg" {
  name        = "${var.project_name}-${var.environment}-monitoring-sg"
  description = "Security group for the monitoring instance and monitoring web interfaces."
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow SSH access from the configured SSH CIDR block"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_cidr]
  }

  ingress {
    description = "Allow access to the Grafana web interface"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [var.ssh_cidr]
  }

  ingress {
    description = "Allow access to the Prometheus web interface"
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = [var.ssh_cidr]
  }

  ingress {
    description = "Allow access to the Alertmanager web interface"
    from_port   = 9093
    to_port     = 9093
    protocol    = "tcp"
    cidr_blocks = [var.ssh_cidr]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-${var.environment}-monitoring-sg"
  })
}

#tfsec:ignore:aws-ec2-no-public-egress-sgr:exp:2026-06-30
resource "aws_security_group" "app_sg" {
  name        = "${var.project_name}-${var.environment}-app-sg"
  description = "Security group for application instances and internal monitoring endpoints."
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow SSH access from the configured SSH CIDR block"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_cidr]
  }

  ingress {
    description     = "Allow SSH from monitoring (bastion) SG"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.monitoring_sg.id]
  }

  ingress {
    description = "Allow application access from the monitoring security group"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    security_groups = [aws_security_group.monitoring_sg.id]
  }

  ingress {
    description     = "Allow node_exporter access from the monitoring security group"
    from_port       = 9100
    to_port         = 9100
    protocol        = "tcp"
    security_groups = [aws_security_group.monitoring_sg.id]
  }

  ingress {
    description     = "Allow cAdvisor access from the monitoring security group"
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.monitoring_sg.id]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-${var.environment}-app-sg"
  })
}
