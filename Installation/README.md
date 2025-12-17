# Terraform Installation

### Download Terraform

* Go to the official Terraform download page:

  **https://developer.hashicorp.com/terraform/downloads**

* Choose your OS and architecture (e.g., Windows 64-bit, Linux 64-bit, macOS Intel).

* Download the zip file.

### Install Terraform

#### Windows

* Extract the **terraform.exe** from the zip.

* Move it to a directory, e.g., C:\terraform.

* Add the directory to your System PATH:

  * Search Environment Variables → Edit System Variables → Path → Add C:\terraform.

* Open Command Prompt and verify:

```hcl
terraform -version
```

#### macOS

* Extract the binary.

* Move it to /usr/local/bin (or any folder in your PATH):

```hcl
sudo mv terraform /usr/local/bin/
```

* Verify installation:

```hcl
terraform -version
```

#### Linux

* Extract the downloaded zip:

```hcl
unzip terraform_*.zip
```

* Move it to /usr/local/bin:

```hcl
sudo mv terraform /usr/local/bin/
```

* Verify:

```hcl
terraform -version
```

After this, Terraform is installed and ready. You can start with:

```hcl
terraform init
terraform plan
terraform apply
```
