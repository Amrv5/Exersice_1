First step to provision resources to a cloud provider is :

Terraform init: initializes a working directory and downloads the necessary provider plugins and modules and setting up the backend for storing your infrastructure's state .

Second step :
The terraform plan command : creates an execution plan, which lets you preview the changes that Terraform plans to make to your infrastructure .

Third step (not mandatory)

terraform validate :

The validate command in Terraform is used to verify the correctness of Terraform configuration files.

Last step :

The terraform apply command executes the actions proposed in a terraform plan.

There is also Terafform Destroy if we want to remove provisioned resources from the cloud .

**NOTE 

*not all the values provided are ligetimate, some of the values provided are from my own head as i haven't tested provisioned any of the resources mentioned .
