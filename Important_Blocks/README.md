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

