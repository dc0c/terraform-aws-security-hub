# AWS Security Hub Terraform Module
# This module provisions and configures AWS Security Hub

terraform {
  required_version = ">= 1.12.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0.0"
    }
  }
}

# Enable Security Hub
resource "aws_securityhub_account" "main" {
  enable_default_standards = var.enable_default_standards
}

# Subscribe to security standards
resource "aws_securityhub_standards_subscription" "aws_foundational" {
  count         = var.enable_aws_foundational_standard ? 1 : 0
  standards_arn = "arn:aws:securityhub:::ruleset/finding-format/aws-foundational-security-standard/v/1.0.0"
  depends_on    = [aws_securityhub_account.main]
}

resource "aws_securityhub_standards_subscription" "cis" {
  count         = var.enable_cis_standard ? 1 : 0
  standards_arn = "arn:aws:securityhub:::ruleset/finding-format/cis-aws-foundations-benchmark/v/1.2.0"
  depends_on    = [aws_securityhub_account.main]
}

resource "aws_securityhub_standards_subscription" "pci_dss" {
  count         = var.enable_pci_dss_standard ? 1 : 0
  standards_arn = "arn:aws:securityhub:::ruleset/finding-format/pci-dss/v/3.2.1"
  depends_on    = [aws_securityhub_account.main]
}

# Configure Security Hub insights (optional)
resource "aws_securityhub_insight" "custom_insights" {
  for_each = var.custom_insights

  name = each.key
  filters {
    aws_account_id {
      comparison = "EQUALS"
      value      = each.value.account_filter
    }
    severity_label {
      comparison = "EQUALS"
      value      = each.value.severity
    }
  }
  group_by_attribute = each.value.group_by

  depends_on = [aws_securityhub_account.main]
}
