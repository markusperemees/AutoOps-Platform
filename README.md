# AutoOps Platform

Infrastructure automation and monitoring project for AWS, built with Terraform and Ansible.

## Current Status

The repository currently includes:

- **Terraform infrastructure** for:
  - VPC, public/private subnets, route tables, NAT gateway
  - EC2 instances (monitoring node + app nodes)
  - Security groups for SSH and monitoring traffic
  - Remote state bootstrap (S3 + DynamoDB lock table)
- **Ansible automation** for:
  - Base bootstrap (`bootstrap.yml`) on all nodes
  - Monitoring stack deployment (`monitoring.yml`)
  - App stack deployment (`app.yml`)
- **Monitoring stack** (Docker Compose):
  - Prometheus
  - Alertmanager
  - Grafana
  - Node Exporter (monitoring node and app nodes)
  - cAdvisor (app nodes)
  - Demo app (`stefanprodan/podinfo`)
- **Grafana provisioning**:
  - Prometheus datasource
  - Auto-provisioned dashboard(s)
- **Alerting**:
  - Prometheus alert rules
  - Alertmanager integration for Discord webhook notifications

All main playbooks are tested as **idempotent**.

## Repository Layout

- `terraform/` - infrastructure code (bootstrap, envs, reusable modules)
- `ansible/` - inventory, config, playbooks, templates

## Quick Run (Ansible)

From WSL/Linux shell:

```bash
ANSIBLE_CONFIG=/mnt/c/projektid/AutoOps-Platform/ansible/ansible.cfg \
ansible-playbook -i /mnt/c/projektid/AutoOps-Platform/ansible/inventory.ini \
/mnt/c/projektid/AutoOps-Platform/ansible/playbooks/bootstrap.yml

ANSIBLE_CONFIG=/mnt/c/projektid/AutoOps-Platform/ansible/ansible.cfg \
ansible-playbook -i /mnt/c/projektid/AutoOps-Platform/ansible/inventory.ini \
/mnt/c/projektid/AutoOps-Platform/ansible/playbooks/monitoring.yml

ANSIBLE_CONFIG=/mnt/c/projektid/AutoOps-Platform/ansible/ansible.cfg \
ansible-playbook -i /mnt/c/projektid/AutoOps-Platform/ansible/inventory.ini \
/mnt/c/projektid/AutoOps-Platform/ansible/playbooks/app.yml
```

For Discord alerts, pass webhook URL at runtime.
