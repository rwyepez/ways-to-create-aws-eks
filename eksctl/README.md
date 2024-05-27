
# EKS Cluster Setup with eksctl

## Step 1: Configure AWS CLI

1. **Configure AWS CLI with a User (not root)**:
   - Make sure the user has the necessary permissions to create an EKS cluster.

## Step 2: Install eksctl

1. **Installation Instructions**:
   - Follow the detailed instructions [here](https://docs.aws.amazon.com/es_es/emr/latest/EMR-on-EKS-DevelopmentGuide/setting-up-eksctl.html).
   
   - For macOS
   ```sh
   brew tap weaveworks/tap
   brew install weaveworks/tap/eksctl
   ```

## Step 3: Create the EKS Cluster

1. **Create a VPC**:
   - Ensure you have a VPC set up with:
     - Two public subnets in different Availability Zones.
   - Create an IAM role for the EKS cluster following [these instructions](https://docs.aws.amazon.com/eks/latest/userguide/service_IAM_role.html#create-service-role).

2. **Create IAM Role for NodeGroup**:

   1. **Create the IAM Role**:
      - Open the AWS Management Console and navigate to the IAM service.
      - In the left navigation pane, select "Roles" and click "Create role".
      - Select "AWS service" and then "EC2" as the service that will use this role.
      - Click "Next: Permissions".

   2. **Attach Policies**:
      - Attach the necessary policies to allow your nodes to work with EKS.
      - Search for and select the following policies:
        - `AmazonEKSWorkerNodePolicy`
        - `AmazonEC2ContainerRegistryReadOnly`
        - `AmazonEKS_CNI_Policy`

## Step 4: Execute Commands

1. **Create Cluster Configuration File**:
   - Create a `cluster-config.yaml` file with the necessary configuration for your cluster.

2. **Create the EKS Cluster**:
   - Run the following command to create the cluster:
     ```sh
     eksctl create cluster -f cluster-config.yaml
     ```

3. **Update Kubeconfig**:
   - Update the kubeconfig file to use the newly created cluster:
     ```sh
     aws eks update-kubeconfig --name mycluster --region us-east-1
     ```
