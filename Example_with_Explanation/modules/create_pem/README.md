# create_pem module

### main.tf

* In this module we are creting the **pem** key which is used to login to the ec2 machine.

* Using **"tls_private_key"** resource block to generate cryptographic key pairs

* Using **"aws_key_pair"** resource block Registers an SSH public key in AWS and allows EC2 instances to use that key for SSH login

* Using **"local_file"** resource block we wright the private key to specified file location.

* Later we use this key to login to the ec2 machine which we create using the **create_ec2** module.

### variable.tf

* Creating he variables **key_name** and **key_path**

* these two variables will get the values from **variable.tf** file in the root module which itself get values from **terraform.tfvars**.

### outputs.tf

* Create a output variable **pem_key** which is later used while creating the ec2 machine.