# Complete Security Hub Example

This example demonstrates advanced usage of the AWS Security Hub Terraform module with all available features.

## What This Example Does

- Enables AWS Security Hub
- Configures multiple security standards (AWS Foundational, CIS)
- Creates custom insights for high and critical severity findings
- Applies comprehensive tagging

## Features Demonstrated

- Multiple security standards
- Custom insights creation
- Dynamic account ID resolution
- Comprehensive tagging strategy

## Usage

1. Clone this repository
2. Navigate to this example directory
3. Initialize Terraform:
   ```bash
   terraform init
   ```
4. Plan the deployment:
   ```bash
   terraform plan
   ```
5. Apply the configuration:
   ```bash
   terraform apply
   ```

## Requirements

- AWS CLI configured with appropriate permissions
- Terraform >= 1.0
- AWS provider >= 5.0

## Permissions Required

Your AWS credentials need the following permissions:
- `securityhub:EnableSecurityHub`
- `securityhub:GetEnabledStandards`
- `securityhub:BatchEnableStandards`
- `securityhub:CreateInsight`
- `securityhub:GetInsights`
- `sts:GetCallerIdentity`

## Outputs

This example provides detailed outputs showing:
- Security Hub account configuration
- Enabled standards status
- Created custom insights
