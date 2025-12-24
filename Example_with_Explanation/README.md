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
│   │    ├──main.tf
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

### provider.tf

* Specified and configured the provider

### versions.tf

* Specifid the version of terraform to ensures team members use Terraform 1.3.7 or later.

* Ensures Terraform uses the specified provider version.

* Backend configuration for remote state in S3.

### main.tf

* We are using s3 bucket as of backend to store our state file.

* created a s3 bucket, enabling server side encyption for s3 bucket as our state file may contain some confidential information.

* Enabling versioning in s3 bucket.

* Maintaining lockID for state file and we created dynamodb to store LockID

* Calling the module **cerete_pem** to create private key which we later attach this to ec2 machine and use to login to ec2 machine.

* Calling **create_sg** module to create security group with inbound and outbount rules.

* Calling **create_ec2** module to create ec2 machine using the security group and pem key created by other modules.

* Calling **file_provisioner** module to copy file from local machine to ec2 machine by connecting to that machine.

* Calling **remote_exec** module to run commands on ec2 machine by connection to that machine.

### vaiables.tf

* Here we have all the variables used in all the sub modules and we provide default values for all the variables.

* These default values will be used if they are not overrriden by **terraform.tfvars** file or by any other way.

### outputs.tf

* Create a output variable **public_ip** of the ec2 machine.

### terraform.tfvars

* Here we can provide values for all the variable that we used in this project.

* Here we use at as a single point of control to edit all the variables (including variables used in sub modules).