# Basic Security Hub Example

terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "security_hub" {
  source = "../../"
  
  enable_default_standards = true
  
  tags = {
    Environment = "development"
    Example     = "basic"
  }
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

output "security_hub_account_id" {
  description = "Security Hub account ID"
  value       = module.security_hub.security_hub_account_id
}
