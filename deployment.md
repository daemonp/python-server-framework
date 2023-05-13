# Deployment Guide for Python Application

This guide will walk you through the steps required to deploy your 
Python Flask application on a Kubernetes cluster in DigitalOcean.

## Prerequisites

- A DigitalOcean account
- Docker installed on your local machine
- The `doctl` DigitalOcean command-line client installed
- The `kubectl` command-line tool installed

## Steps

### 1. Create a Kubernetes Cluster in DigitalOcean

You can create a Kubernetes cluster in DigitalOcean using the 
`doctl` command-line client. First, authenticate `doctl` with your 
DigitalOcean account:

```bash
doctl auth init
```

Then, create a Kubernetes cluster. Replace [cluster-name] with the 
name you want to give to your cluster:

`doctl kubernetes cluster create [cluster-name]`

### 2. Set Up kubectl to Communicate with Your Cluster

After your cluster is created, you'll receive a kubeconfig file. 
You can use this file to configure kubectl to communicate with your 
cluster.

Move the kubeconfig file to your ~/.kube directory and set the 
KUBECONFIG environment variable to point to the file:

```bash
mv /path/to/your/kubeconfig.yaml ~/.kube/
export KUBECONFIG=~/.kube/kubeconfig.yaml
```

### 4. Create a Kubernetes Deployment

Modify the file kubernetes/app-deployment.yaml with the following 
content. Replace [username] and [image-name] with your GitHub 
username and Docker image name, respectively:

Then, apply the Deployment with kubectl:

```bash
kubectl apply -f kubernetes/app-deployment.yaml
```

### 4. Expose the Deployment with a Service


After creating the Deployment, you need to expose it so it can 
receive traffic. This can be done by creating a Service of type 
LoadBalancer.

The file named `kubernetes/app-service.yaml` will have a mapping 
for the internet port to your applications port. 

```bash
kubectl apply -f kubernetes/app-service.yaml
```
Note: This is only required if your application will be serving 
http traffic.

### 4. Check to see if it's all working

After a few minutes, the Service should receive an external IP 
address. You can check the Service's details with the following 
command:

```bash
kubectl get service myapp-service
```

