# AWS EKS Cluster Configuration Project

This project contains four different methods for creating an AWS EKS cluster. Each method has its own folder and its own README file with detailed instructions.

## Available Methods

1. **Manual**
   - [Manual Instructions](./manual/README.md)
   
2. **eksctl**
   - [Instructions with eksctl](./eksctl/README.md)

3. **Terraform**
   - [Instructions with Terraform](./terraform/README.md)

4. **Cloudformation**
   - [Instructions with Cloudformation](./cloudformation/README.md)

## General Description

### Manual
The manual method provides a step-by-step guide to setting up an EKS cluster using the AWS console and AWS CLI commands. This method is ideal for those who want to understand each step of the process in detail.

### eksctl
eksctl is a simple command-line tool for creating and managing EKS clusters on AWS. This method significantly simplifies the process and is ideal for those seeking a quick and efficient setup.

### Terraform
Terraform is an infrastructure as code tool that allows you to define and manage EKS clusters using configuration files. This method is ideal for those looking for automation and control in their deployments.

### Cloudformation
Cloudformation is an infrastructure as code tool that allows you to define and manage EKS clusters using configuration files. This method is ideal if your main cloud provider is AWS.

## Prerequisites

- An AWS account
- AWS CLI installed and configured
- eksctl installed (for the eksctl method)
- Terraform installed (for the Terraform method)

## Getting Started

To get started, select one of the methods mentioned above and follow the instructions in the corresponding README.
