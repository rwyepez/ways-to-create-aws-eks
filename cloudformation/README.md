# EKS Cluster Setup with Cloudformation

## Step 1: Configure AWS CLI

1. **Configure AWS CLI**:
   - Ensure you have the necessary credentials and permissions to create an EKS cluster.
   ```sh
   aws configure

## Step 2: Update Parameters Files

1.  **Verify/Set Values in eks_params.json**:
    - Ensure the values in the eks_params.json file are correctly set.

## Step 3: Execute cloudformation command
1. **Create eks cluster**:
    ```sh
    aws cloudformation create-stack --stack-name my-eks-cluster --template-body file://eks_cluster.yaml --parameters file://eks_params.json --capabilities CAPABILITY_NAMED_IAM

## Step 4: Update Kubeconfig
   - Update the kubeconfig file to use the newly created cluster:
     ```sh
     aws eks update-kubeconfig --name mycluster --region us-east-1
     ```

## Step 5: Delete cloudformation stack
    - Update the kubeconfig file to use the newly created cluster:
     ```sh
     aws cloudformation delete-stack --stack-name my-eks-cluster
     ```