### file_provisioner

* In this module we connect to the ec2 machine and copy file from local system to ec2 machine.

### main.tf

* Uses **null_resource** because no real AWS resource is being created

* **connection** block Connects to an EC2 instance using SSH.

* **provisioner file** Copies a local file/folder to the EC2 server.

### variables.tf

* Creating the variables **ec2_public_ip**, **ec2_username**, **ec2_pem**, **source_path** and **destination_path**.

* These variable will get the values from **variable.tf** file in the root module which itself get values from **terraform.tfvars**.

* All these variables are used in **main.tf** during build connection and copy file from local system to ec2 machine.
