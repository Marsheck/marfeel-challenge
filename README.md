# marfeel-challenge

# Setting up the AWS Provider with Terraform

First, I defined our AWS provider in the Terraform file. This is done by providing the necessary region and credentials to access the AWS account. Ensure you have the correct credentials configured on your local machine.

# Creating the EKS Cluster

I then proceed to create the EKS cluster for each environment (dev, stage, and production) by specifying the Kubernetes version, cluster name, VPC, and instance type. This is achieved through the module "eks" in the Terraform files. The details of each cluster (endpoint and certificate authority data) are stored in a local variable, cluster_configurations, for easy reference.

# Setting up ArgoCD

I set up ArgoCD manually using a YAML configuration file instead of the helm provider in Terraform. The installation of ArgoCD is done by applying the install.yaml file in the argo-install directory. This YAML file contains all the necessary Kubernetes resources needed to set up ArgoCD. After running kubectl apply -f install.yaml, ArgoCD will be installed in its own namespace within the EKS cluster.

ArgoCD is accessible via a LoadBalancer service, which provides an external IP address that you can use to access the ArgoCD UI from the internet.

# Setting Up ArgoCD Applications

For each application (API and Statics), I create a Kubernetes manifest of kind Application in a separate file for each environment (dev, stage, and production). Each file specifies the corresponding branch in the Git repository to sync the application manifests from, and the destination namespace and cluster for deployment. We then apply these manifests using kubectl apply -f application.yaml command.

# Deploying the Applications

I created two applications - an API application and a Statics application - for each environment, each with its own namespace and running specific images.

The API application responds to /api requests and runs the gcr.io/google_containers/echoserver:1.4 image, while the Statics application responds to /statics.html requests and runs the nginx image.

# Multi-Cluster Setup

The Terraform code is designed to provide three different clusters (dev, stage, production), each able to deploy a different branch of the application repository. This is done by specifying the branch to be deployed as a variable during Terraform apply.

Accessing ArgoCD Credentials

# To access ArgoCD credentials:



Run the following command to get the ArgoCD Server password:



    kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

    The username is admin.

    Access the ArgoCD UI at the LoadBalancer IP and use these credentials to log in.
