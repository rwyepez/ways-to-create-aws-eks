# Manual EKS Cluster Setup

## Step 1: Preliminary Setup

1. **Create a VPC**:
   - Ensure you have a VPC set up in your AWS account.

2. **Create Public Subnets**:
   - Create 2 public subnets in different Availability Zones.

3. **Create an IAM Role for EKS Cluster**:
   - Follow the instructions [here](https://docs.aws.amazon.com/eks/latest/userguide/service_IAM_role.html#create-service-role) to create an IAM role for the EKS cluster.

## Step 2: Create the EKS Cluster

1. **Using the AWS Console**:
   - Create a new EKS cluster named `mycluster` with a user different that root with permissions to create eks cluster.

## Step 3: Set Up Node Group

1. **Create IAM Role for Node Group**:
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

## Step 4: Configure AWS CLI and Update Kubeconfig

1. **Configure AWS CLI**:
   - Set up the credentials for the same user that create the cluster using the command:
     ```sh
     aws configure
     ```

2. **Update Kubeconfig**:
   - Update the kubeconfig file to use the newly created cluster:
     ```sh
     aws eks update-kubeconfig --name mycluster --region us-east-1
     ```
