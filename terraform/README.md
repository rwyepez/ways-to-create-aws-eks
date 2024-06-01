# EKS Cluster Setup with Terraform

## Step 1: Configure AWS CLI

1. **Configure AWS CLI**:
   - Ensure you have the necessary credentials and permissions to create an EKS cluster.
   ```sh
   aws configure

## Step 2: Create S3 Bucket for Terraform State

1. **Create an S3 Bucket**:
    - Create an S3 bucket to store the Terraform state file with a global unique name. For example:
    ```sh
    aws s3api create-bucket --bucket my-terraform-state-bucket --region us-east-1

## Step 3: Update Configuration Files

1. **Replace the Bucket Name in config.tf**:
    - Open the config.tf file and replace the placeholder bucket name with your actual bucket name.
2.  **Verify/Set Values in values.tfvars**:
    - Ensure the values in the values.tfvars file are correctly set, especially the node_instance_type variable, which specifies the instance type for the worker nodes.

## Step 4: Execute Terraform Commands
1. **Initialize Terraform**:
    ```sh
    terraform init
2. **Validate Terraform Configuration**:
    ```sh
    terraform validate
3. **Plan the Terraform Deployment**:
    ```sh
    terraform plan -var-file="values.tfvars"
4. **Apply the Terraform Plan**:
    ```sh
    terraform apply -var-file="values.tfvars"

## Step 5: Update Kubeconfig
   - Update the kubeconfig file to use the newly created cluster:
     ```sh
     aws eks update-kubeconfig --name my-cluster --region us-east-1
     ```

## Step 6: Destroy infrastructure
   - Destroy:
     ```sh
    terraform destroy -var-file="values.tfvars"