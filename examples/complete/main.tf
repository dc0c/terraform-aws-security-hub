# Complete Security Hub Example

terraform {
  required_version = ">= 1.12.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "security_hub" {
  source = "../../"
  
  enable_default_standards        = true
  enable_aws_foundational_standard = true
  enable_cis_standard            = true
  enable_pci_dss_standard        = false
  
  custom_insights = {
    "high-severity-findings" = {
      account_filter = data.aws_caller_identity.current.account_id
      severity       = "HIGH"
      group_by       = "ResourceId"
    }
    "critical-findings" = {
      account_filter = data.aws_caller_identity.current.account_id
      severity       = "CRITICAL"
      group_by       = "ComplianceStatus"
    }
  }
  
  tags = {
    Environment = "production"
    Team        = "security"
    Example     = "complete"
  }
}

data "aws_caller_identity" "current" {}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

output "security_hub_details" {
  description = "Complete Security Hub configuration details"
  value = {
    account_id        = module.security_hub.security_hub_account_id
    arn              = module.security_hub.security_hub_arn
    enabled_standards = module.security_hub.enabled_standards
    custom_insights   = module.security_hub.custom_insights_ids
  }
}
