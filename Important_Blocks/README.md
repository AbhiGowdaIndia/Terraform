# Some important blocks

* In Terraform, the configuration files are made up of several important blocks that define how your infrastructure is created and managed. 

* Here’s a  explanation of some of the main blocks:

* **provider**

  * Specifies which cloud or service Terraform will interact with.
  
  * Mandatory for Terraform to know where to create resources.

  * Can configure multiple providers (AWS, Azure, GCP, etc.).

  Example: 

  ```hcl
  provider "aws" {
  region = "ap-south-1"
  }
  ```

* **resource**

  * Defines infrastructure objects you want to create (VMs, buckets, databases, etc.).

  * Format: resource "<TYPE>" "<NAME>" { ... }

  * Each resource has arguments specific to its type.

  Example:

  ```hcl
  resource "aws_instance" "web" {
  ami           = "ami-0abcdef12345"
  instance_type = "t2.micro"
  }
  ```

* **variable**

  * Defines input variables for your Terraform code.

  * Makes your code dynamic and reusable.

  * Values can be passed via CLI, .tfvars files, or environment variables.

  Example:

  ```hcl
  variable "instance_type" {
  description = "Type of EC2 instance"
  default     = "t2.micro"
  }
  ```

* **output**

  * Defines outputs that Terraform will show after applying the plan.

  * Useful for exposing important info like IPs, URLs, or IDs.

  Example:

  ```hcl
  output "instance_ip" {
  value = aws_instance.web.public_ip
  }
  ```

* **data**

  * Fetches existing resources from a provider without creating them.

  * Helpful when you want to reference existing infrastructure.

  Example:

  ```hcl
  data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
   }
  }
  ```

* **locals**

  * Defines local values for reuse in your configuration.

  Example: 

  ```hcl
  locals {
  environment = "dev"
  bucket_name = "myapp-${local.environment}"
  }
  ```

* **module**

  * Groups resources into reusable components.

  * Allows code reusability and better organization.

  * Can be local or remote (Terraform Registry, GitHub, etc.).

  Example:

  ```hcl
  module "vpc" {
  source = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  }
  ```

* **terraform**

  * Configures Terraform itself (backend, required version, etc.).

  * Specifies state storage and versioning.

  Example: 

  ```hcl
  terraform {
  required_version = ">= 1.5.0"
  backend "s3" {
    bucket = "tf-state-bucket"
    key    = "prod/terraform.tfstate"
    region = "ap-south-1"
   }
  }
  ```

* **lifecycle**

  * Controls the behavior of resources (create before destroy, prevent destroy, ignore changes).

  * Helps avoid downtime or accidental deletions.

  Example:

  ```hcl
  resource "aws_instance" "web" {
  ami           = "ami-0abcdef12345"
  instance_type = "t2.micro"

  lifecycle {
    create_before_destroy = true
    prevent_destroy       = true
   }
  }
  ```