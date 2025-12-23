# remote_exec module

*  In this module we connect to the ec2 machine and run the list of commands in ec2 machine.

### main.tf

* Uses **null_resource** because no real AWS resource is being created

* **connection** block Connects to an EC2 instance using SSH.

* **provisioner remote_exec** will execute list of commands received from **variable.tf** file in root which intern receive values from **terraform.tfvars**.

### variables.tf

* Creating the variables **ec2_public_ip**, **ec2_username**, **ec2_pem** and **inline_commands**.

* These variable will get the values from **variable.tf** file in the root module which itself get values from **terraform.tfvars**.

* All these variables are used in **main.tf** during build connection and execute commands in ec2 machine.

 