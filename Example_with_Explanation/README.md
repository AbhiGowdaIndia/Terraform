# Simple Example with Example

### Project structure

```css
Example_with_Explanation/
├── modules/
│   ├── create_ec2/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── create_pem/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── create_sg/
│   │   ├── main.tf
│   │   ├── terraform.tfvars
│   │   └── backend.tf
│   ├── file_provisioner/
│   │    ├── main.tf
│   │    └──variables.tf
│   └── remote_exec
│        ├── main.tf
│        └──variables.tf
├── main.tf 
├── providers.tf
├── versions.tf
├── variables.tf
├── outputs.tf
└── terraform.tfvars
```

### main.tf

* We are using s3 bucket as of backend to store our state file.

* created a s3 bucket, enabling server side encyption for s3 bucket as our state file may contain some confidential information.

* Enabling versioning in s3 bucket.

* Maintaining lockID for state file and we created dynamodb to store LockID

### versions.tf

* Specifid the version of terraform to ensures team members use Terraform 1.3.7 or later.

* Ensures Terraform uses the specified provider version.

* Backend configuration for remote state in S3