# Multi-Module Terraform Project Structure

```css
terraform-project/
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── ec2/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
├── envs/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── terraform.tfvars
│   │   └── backend.tf
│   └── prod/
│       ├── main.tf
│       ├── terraform.tfvars
│       └── backend.tf
├── providers.tf
├── versions.tf
├── variables.tf
└── outputs.tf
```

### modules/

  * Reusable pieces of infrastructure (VPC, EC2, RDS)

  * Each module has its own main.tf, variables.tf, outputs.tf

### envs/

  * Environment-specific configurations (dev/prod/staging)

  * Can override module variables

### Root files

  * Common provider & version definitions

  * Global outputs


## Best Practices for Terraform Folder Structure

  * **Separate modules:** Keep reusable code modular.

  * **Environment directories:** Avoid changing dev/prod in same folder.

  * **Separate variables, outputs, providers:** Improves readability.

  * **Use .gitignore:** Exclude .terraform/ and terraform.tfstate.

  * **Backend remote state:** Use S3/DynamoDB, Azure Storage, etc.

  * **Version pinning:** Lock Terraform & provider versions to prevent breaking changes.