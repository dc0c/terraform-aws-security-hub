# Outputs for AWS Security Hub Module

output "security_hub_account_id" {
  description = "The AWS account ID where Security Hub is enabled"
  value       = aws_securityhub_account.main.id
}

output "security_hub_arn" {
  description = "The ARN of the Security Hub account"
  value       = aws_securityhub_account.main.arn
}

output "enabled_standards" {
  description = "List of enabled security standards"
  value = {
    aws_foundational = var.enable_aws_foundational_standard
    cis_benchmark    = var.enable_cis_standard
    pci_dss         = var.enable_pci_dss_standard
  }
}

output "custom_insights_ids" {
  description = "Map of custom insight names to their IDs"
  value       = { for k, v in aws_securityhub_insight.custom_insights : k => v.id }
}