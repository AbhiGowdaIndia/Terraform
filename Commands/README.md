# Commonly used commands

#### terraform init

  * **terraform** init prepares your directory so Terraform can work.

  * Reads the required_providers block and downloads provider plugins (AWS, Azure, GCP, etc.)

  * initialize and configure the backend.

  ```cmd
  terraform init
  ```

#### terraform fmt

  * Automatically formats Terraform code to HashiCorp standards.

  * What it does internally:

    * Fixes indentation

    * Sorts arguments

    * Aligns equals (=)

  ```cmd
  terraform fmt
  ```

  * Formats Terraform files in:

    * Current directory

    * All sub-directories (recursively)

  ```cmd
  terraform fmt -recursive
  ```

#### terraform validate

  * To check whether your Terraform configuration is syntactically correct and internally consistent.

  * It helps you catch errors early, before running terraform plan or terraform apply.

  ```cmd
  terraform validate
  ```

#### terraform plan

  * terraform plan is one of the most important Terraform commands.

  * It creates an execution plan that shows what Terraform will do before it actually makes any changes.

  * Think of it as a dry-run or preview of terraform apply.

  ```cmd
  terraform plan
  ```

  * To save plan in perticular file

  ```cmd
  terraform plan -out=tfplan
  ```

  * To pass variables 

  ```cmd
  terraform plan -var="instance_type=t3.micro"
  ```

  * To pass variables from a file

  ```cmd
  terraform plan -var-file="dev.tfvars"
  ```

#### terraform apply

  * terraform apply is the command that actually creates, updates, or deletes infrastructure based on your Terraform configuration.

  * If terraform plan is “what will happen”, then terraform apply is “make it happen.”

  ```cmd
  terraform apply
  ```

  * Apply plan saved in a file

  ```cmd
  terraform apply tfplan
  ```

  * Auto-approve (no confirmation)

  ```cmd
  terraform apply --auto-approve
  ```

  * Apply using variable files
  
  ```cmd
  terraform apply -var-file="dev.tfvars"
  ```

  * Target a specific resource (use carefully)

  ```cmd
  terraform apply -target=aws_instance.web
  ```

  * To run perticular scripts only

  ```cmd
  terraform apply <script>.tf <script2>.tf
  ```

#### terraform destroy

  * To tear down (delete) infrastructure that was created and is managed by Terraform.

  * If terraform apply creates resources, terraform destroy removes them safely using the Terraform state.

  * Destroy all resources

  ```cmd
  terraform destroy
  ```

  * Destroy with variable file

  ```cmd
  terraform destroy -var-file="dev.tfvars"
  ```

  * Destroy with auto-approve (dangerous)

  ```cmd
  terraform destroy --auto-approve
  ```

  * Targeted destroy (use carefully)

  ```cmd
  terraform destroy -target=aws_instance.web
  ```

  * Destroy using a saved plan (advanced)

  ```cmd
  terraform plan -destroy -out=destroy.tfplan
  terraform apply destroy.tfplan
  ```

#### terraform output

  * To read and display output values that are defined in your Terraform configuration and stored in the state file.

  * Basic command

  ```cmd
  terraform output
  ```

  * Get a specific output

  ```cmd
  terraform output instance_public_ip
  ```

  * Raw output (scripts & automation)

  ```cmd
  terraform output -raw instance_public_ip
  ```

  * JSON output (CI/CD & tools)

  ```cmd
  terraform output -json
  ```

#### terraform show

  * To display the contents of Terraform state or a saved plan file in a human-readable format.

  * It helps you understand what Terraform knows about your infrastructure.

  * Show current state

  ```cmd
  terraform show
  ```

  * Show a specific plan file

  ```cmd
  terraform show tfplan
  ```

  * JSON output (automation & tooling)

  ```cmd
  terraform show -json
  ```

  * Show a single resource (better approach)

  ```cmd
  terraform state show aws_instance.web
  ```
  