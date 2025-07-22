# Variables for AWS Security Hub Module

variable "enable_default_standards" {
  description = "Whether to enable default security standards when Security Hub is enabled"
  type        = bool
  default     = true
}

variable "enable_aws_foundational_standard" {
  description = "Whether to enable AWS Foundational Security Standard"
  type        = bool
  default     = true
}

variable "enable_cis_standard" {
  description = "Whether to enable CIS AWS Foundations Benchmark standard"
  type        = bool
  default     = false
}

variable "enable_pci_dss_standard" {
  description = "Whether to enable PCI DSS standard"
  type        = bool
  default     = false
}

variable "custom_insights" {
  description = "Map of custom Security Hub insights to create"
  type = map(object({
    account_filter = string
    severity       = string
    group_by       = string
  }))
  default = {}
}

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default     = {}
}