# create_ec2 module

Here we creating the ec2 machine using the security gruoup and pem key created in other modules.

### main.tf

* Using the **data** block read the existing AWS resources and get the ami id to create ec2 machine.

* Create an ec2 instance using **aws_instance** resource with pem key and security groups created in other modules.

### variables.tf

* Creating the variables **instance_type**, **pem_key** and **sg_id**.

* These variable will get the values from **variable.tf** file in the root module which itself get values from **terraform.tfvars**.

### outputs.tf

* Create a output variable **public_ip** which is later used while login in to the ec2 machine.