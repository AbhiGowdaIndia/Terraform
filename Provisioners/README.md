# Provisioners

* Provisioners in Terraform are used to execute scripts or commands on a local or remote machine after a resource is created.

* Terraform first creates the resource (e.g., EC2 instance, VM, container).

* Then, provisioners are triggered to run scripts or commands.

* They can run locally (on your machine) or remotely (on the resource itself).

* Types of Provisioners:

  * **file provisioner:**

    * Copies files or directories from the local machine where Terraform is running to the newly created remote resource. 
    
    * It requires a connection block to establish an SSH or WinRM connection to the destination machine.

    ```hcl
    provisioner "file" {
    source      = "local_path_to_file_or_directory"
    destination = "remote_path_on_resource"
    }
    ```

  * **local-exec provisioner:**
  
    * Invokes an executable or script on the local machine (where terraform apply is executed). 
    
    * This is commonly used for tasks that interact with local systems, such as recording the new resource's IP address in a local file or running post-deployment checks.

    ```hcl
    # local-exec provisioner runs on your machine
    provisioner "local-exec" {
    command = "echo 'S3 Bucket created: ${self.bucket}' >> created_buckets.log"
    }
    ```

  * **remote-exec provisioner:**
  
    * Invokes a script or a list of command strings on the remote resource after it has been created. 
    
    * It typically connects via SSH or WinRM and is used for bootstrapping, installing software (like NGINX), or running configuration management tools on the newly provisioned instance. 

    * **inline:**

      * Accepts a list of commands to run directly on the remote host.

      ```hcl
      provisioner "remote-exec" {
      inline = [
        "echo Hello",
        "uptime"
      ]
      }
      ```

    * **script:**

      * Accepts a local script file path. Terraform copies and executes it on the remote host.

      ```hcl
      provisioner "remote-exec" {
      script = "scripts/setup.sh"
      }

    * **scripts:**

      * Accepts a multiple local scripts file paths.

      * Each script is executed in order.

      ```hcl
      provisioner "remote-exec" {
      scripts = ["setup.sh", "install.sh"]
      }
      ```

    