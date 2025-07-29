# Basic Security Hub Example

This example demonstrates the most basic usage of the AWS Security Hub Terraform module.

## What This Example Does

- Enables AWS Security Hub with default settings
- Uses minimal configuration for simplicity

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
- Terraform >= 1.12.0
- AWS provider >= 6.0.0

## Permissions Required

Your AWS credentials need the following permissions:
- `securityhub:EnableSecurityHub`
- `securityhub:GetEnabledStandards`
- `securityhub:BatchEnableStandards`
