This Terraform project is designed to deploy an AWS EC2 instance and integrate it with HashiCorp Vault for secret management. Below is an overview of the project structure and how to use it.

## Project Structure

- **main.tf**: Contains the Terraform configuration for provisioning AWS resources and integrating with Vault.
- **variables.tf**: Defines the variables used within the Terraform configuration.
- **terraform.tfvars**: Contains the values for variables used in the Terraform configuration.
- **README.md**: Provides information and instructions for using the Terraform project.

## Prerequisites

Before using this Terraform project, ensure you have the following:

- Terraform installed on your machine.
- Access to an AWS account with appropriate permissions to create EC2 instances.
- A running instance of HashiCorp Vault accessible from the network where Terraform will be executed.

## Configuration

1. **AWS Provider Configuration**:

   - The AWS provider is configured with the region set to "us-east-1". Adjust the region if needed.

2. **Vault Provider Configuration**:

   - The Vault provider is configured with the address pointing to the Vault instance.
   - `skip_child_token` is set to true.
   - Authentication is done using AppRole method with role_id and secret_id provided.

3. **Vault Secret Retrieval**:

   - The Terraform configuration retrieves a secret named "test-secret" from the "kv" secrets engine in Vault.

4. **AWS EC2 Instance Resource**:

   - An EC2 instance is provisioned with the specified AMI and instance type.
   - Tags are assigned to the instance, including one dynamically fetching a secret from Vault to set as the value for the "Secret" tag.

## Usage

1. Clone this repository to your local machine.
2. Navigate to the directory containing the Terraform files.
3. Initialize Terraform by running:

   `terraform init`

4. Review and adjust the `terraform.tfvars` file to match your desired configuration.
5. Apply the Terraform configuration by running:

   `terraform apply`

6. Confirm the changes proposed by Terraform and type "yes" to proceed with the deployment.
7. Once the deployment is complete, Terraform will output information about the provisioned resources, including the EC2 instance details.

## Cleanup

To destroy the resources provisioned by Terraform, run:

`terraform destroy`

Review the proposed changes and type "yes" to confirm resource deletion.

## Note

- Ensure that the Vault instance is accessible from the network where Terraform is executed, and appropriate authentication methods are configured.
- Review and adjust the Terraform configuration files to match your specific requirements and environment before deployment.
- Exercise caution while managing secrets and ensure they are handled securely throughout the deployment process.
