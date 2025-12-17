# TERRAFORM

* Terraform is an **Infrastructure as Code (IaC)** tool created by **HashiCorp**.

* It is used to create, manage, and update infrastructure (servers, databases, networks, cloud resources) using code instead of manual clicks.

* Terraform is written in **Go / Google Language**.

* **Template code / configuration is written in HCL (Hashicorp Language)**.

* Terraform supports and works with all the major cloud companies like AWS, GCP, Azure, alibaba etc.


### Terraform Life cycle

* Terraform life cycle consists of **init (Terraform init), plan (Terrafor plan), apply (Terraform apply)** and **destroy (Terraform destroy)** stages.

* **Terraform init**

  * Initialize the(local) terraform environment. Usually exeuted only once per session.

* **Terraform plan**

  * terraform plan is a Terraform command that compares your infrastructure code (the desired state) with the current real-world infrastructure (the actual state) and generates an execution plan showing what resources will be created, updated, or destroyed, without making any actual changes.

* **Terraform apply**

  * This executes the plan. This potentially changes the deployment.

* **Terraform destroy**

  * Delete all resources that are governed by this specific terraform environment.



