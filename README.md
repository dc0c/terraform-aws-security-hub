# AWS Security Hub Terraform Module

A simple, easy-to-use Terraform module for provisioning and configuring AWS Security Hub.

## Features

- ✅ Enable AWS Security Hub
- ✅ Configure security standards (AWS Foundational, CIS, PCI DSS)
- ✅ Create custom insights
- ✅ Simple and beginner-friendly
- ✅ Well-documented and tested

## Usage

### Basic Usage

```hcl
module "security_hub" {
  source = "dc0c/security-hub/aws"
  
  enable_default_standards = true
}
```

### Advanced Usage

```hcl
module "security_hub" {
  source = "dc0c/security-hub/aws"
  
  enable_default_standards        = true
  enable_aws_foundational_standard = true
  enable_cis_standard            = true
  enable_pci_dss_standard        = false
  
  custom_insights = {
    "high-severity-findings" = {
      account_filter = "123456789012"
      severity       = "HIGH"
      group_by       = "ResourceId"
    }
  }
  
  tags = {
    Environment = "production"
    Team        = "security"
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.12.0 |
| aws | >= 6.0.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 6.0.0 |

## Resources

| Name | Type |
|------|------|
| aws_securityhub_account.main | resource |
| aws_securityhub_standards_subscription.aws_foundational | resource |
| aws_securityhub_standards_subscription.cis | resource |
| aws_securityhub_standards_subscription.pci_dss | resource |
| aws_securityhub_insight.custom_insights | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| enable_default_standards | Whether to enable default security standards when Security Hub is enabled | `bool` | `true` | no |
| enable_aws_foundational_standard | Whether to enable AWS Foundational Security Standard | `bool` | `true` | no |
| enable_cis_standard | Whether to enable CIS AWS Foundations Benchmark standard | `bool` | `false` | no |
| enable_pci_dss_standard | Whether to enable PCI DSS standard | `bool` | `false` | no |
| custom_insights | Map of custom Security Hub insights to create | `map(object({account_filter = string, severity = string, group_by = string}))` | `{}` | no |
| tags | A map of tags to assign to the resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| security_hub_account_id | The AWS account ID where Security Hub is enabled |
| security_hub_arn | The ARN of the Security Hub account |
| enabled_standards | List of enabled security standards |
| custom_insights_ids | Map of custom insight names to their IDs |

## Examples

See the (./examples) directory for complete usage examples.

## Contributing

Please read (CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## License

This project is licensed under the MIT License - see the (LICENSE) file for details.

## Authors

- NVX-11 -(https://github.com/NVX-11)

## Acknowledgments

- AWS Security Hub documentation
- Terraform AWS Provider documentation
