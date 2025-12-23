# Typical Terraform Project Structure (Single Module)

```css
terraform-project/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── providers.tf
├── backend.tf
├── versions.tf
├── .terraform/      (auto-created after init)
├── terraform.tfstate (auto-created after apply)
└─── terraform.tfstate.backup (auto-created backup)
```

### main.tf

  * Primary configuration file

  * Defines resources and modules

  * Core of our infrastructure

  ```hcl
  resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  tags = {
    Name = "MyWebServer"
   }
  }
  ```

### variables.tf

  * Define input variables

  * Makes code dynamic & reusable

  ```hcl
  variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
  }

  variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
  }
  ```

### terraform.tfvars

  * Provides values for input variables

  * Keeps sensitive/environment-specific info separate

  ```hcl
  region        = "ap-south-1"
  instance_type = "t2.small"
  ```

### outputs.tf

  * Defines output variables

  * Used to display important values after terraform apply

  ```hcl
  output "instance_ip" {
  value = aws_instance.web.public_ip
  description = "Public IP of the web server"
  }
  ```

### providers.tf

  * Defines cloud providers (AWS, Azure, GCP, etc.)

  * Required for Terraform to know where to provision resources

  ```hcl
  terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
   }
  }

  provider "aws" {
    region = var.region
  }
  ```

### backend.tf (optional but recommended)

  * Configures remote state storage

  * Enables collaboration among teams

  ```hcl
  terraform {
  backend "s3" {
    bucket         = "my-terraform-state"
    key            = "prod/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "tf-lock"
   }
  }
  ```

### versions.tf (optional)

  * Locks Terraform version & provider versions

  * Ensures compatibility across environments

  ```hcl
  terraform {
  required_version = ">= 1.5.0"
  }
  ```

### .terraform/ directory

  * Created after terraform init

  * Contains:

    * Provider binaries

    * Module downloads

    * Backend configuration

  * Do not commit to Git (add to .gitignore)

### terraform.tfstate & terraform.tfstate.backup

  * State file: stores the real infrastructure mapping

  * Backup: previous version of state





