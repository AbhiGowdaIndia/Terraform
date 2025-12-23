# create_sg module

* In this module is used to create security group with inbound and outbound rules.

### main.tf

* Creates an AWS Security Group using **"aws_security_group"** resource.

* Allows incoming SSH access (port 22), http traffic (port 80) and https traffic (port 443) using ingress rules.

* Allow outbound traffic through all ports, all protocols to any IPv4 address and to any IPv6 address.

### variables.tf

* Creating he variables **sg_name**.

* This two variable will get the values from **variable.tf** file in the root module which itself get values from **terraform.tfvars**.

### outputs.tf

* Create a output variable **sg_id** which is later used while creating the ec2 machine.