# Deployment Guide for Python Application

This guide will walk you through the steps required to deploy your 
Python application on a Kubernetes cluster in DigitalOcean.

## Understanding Kubernetes, Deployments, and Services

Kubernetes (often abbreviated as K8s) is an open-source platform 
designed to automate deploying, scaling, and operating application 
containers. It groups containers that make up an application into 
logical units for easy management and discovery.

With Kubernetes, you can build a containerized app and deploy it on 
a cluster of physical or virtual machines, making your app highly 
available and resilient to failures. Kubernetes also makes it easy 
to scale your app up and down, depending on the demand.

While K8s is a powerful and feature-rich platform, it can be 
initially overwhelming due to its complexity. However, there are a 
few fundamental constructs in Kubernetes that are relatively 
straightforward and will quickly get you up and running. Concepts 
such as Deployments, which manage the desired state of your 
application, and Services, which provide networking and load 
balancing capabilities, offer a solid foundation for managing 
containerized applications. By focusing on these essential 
components, you can leverage the power of Kubernetes while 
gradually expanding your understanding and utilization of its more 
advanced features. Starting with these basic constructs allows you 
to build scalable and resilient applications without diving into 
the intricacies of the entire Kubernetes ecosystem right from the 
beginning.

### Deployment

In Kubernetes, a Deployment is a high-level concept that manages ReplicaSets, which in turn manage Pods. A Pod is the smallest and simplest unit in the Kubernetes object model that you create or deploy.

A Deployment provides declarative updates for Pods and ReplicaSets. You describe a desired state in a Deployment, and the Deployment Controller changes the actual state to the desired state at a controlled rate. With Deployments, you can:

- Create a Deployment to bring up a ReplicaSet and Pods.
- Update a Deployment to roll out an updated version of the app.
- Rollback to an earlier Deployment if the current version is not stable.
- Scale a Deployment to facilitate more traffic.

### Service

A Kubernetes Service is an abstract way to expose an application 
running on a set of Pods as a network service. The set of Pods 
targeted by a Service is usually determined by a selector.

Services enable the communication between different components 
within and outside of the application. Kubernetes Services route 
traffic to Pods, ReplicaSets, or other Services. They provide a 
stable endpoint that other Pods can use to communicate.

Services are also responsible for load balancing of traffic, which 
is crucial for the high availability of applications.

By creating a Deployment and a Service in Kubernetes, your 
application becomes highly available and resilient to failures. If 
a Pod fails, the Deployment will ensure that another Pod is 
scheduled to replace it, and the Service will route traffic to the 
healthy Pods.

### KISS

Maintaining simplicity and a clear understanding of Kubernetes is 
crucial. While there are tools like Helm that aim to simplify 
certain aspects of Kubernetes, it's important to approach them with 
extreme caution. Helm provides a package manager-like experience 
for deploying applications to Kubernetes, but it can introduce 
additional complexity and dependencies. In some cases, relying 
heavily on such tools can result in a loss of visibility and 
control over the underlying infrastructure. It's vital to strike a 
balance between simplicity and leveraging the full capabilities of 
Kubernetes. Understanding the core concepts and building blocks of 
Kubernetes allows for better troubleshooting, scalability, and 
optimization. By keeping the system as simple and transparent as 
possible, developers and operators can maintain a clearer 
understanding of their applications, making it easier to manage and 
debug any issues that may arise. So do your future self a favor and 
stick to yaml manifests in a git repo :wink: 


## Prerequisites

- A DigitalOcean account
- Docker installed on your local machine
- The `doctl` DigitalOcean command-line client installed
- The `kubectl` command-line tool installed

## Steps

### 1. Create a Kubernetes Cluster in DigitalOcean

You can create a Kubernetes cluster in DigitalOcean using the 
`doctl` command-line client. 

First, authenticate `doctl` with your DigitalOcean account:

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

Note: You may want to add that export line to your local 
environment i.e. ~/.bashrc


Now you should be able to see your cluster at this point

```bash
kubectl get nodes
```

### 4. Create a Kubernetes Deployment

Modify the file kubernetes/app-deployment.yaml with the following 
content. Replace [username] and [image-name] with your GitHub 
username and Docker image name, respectively:

Then, apply the Deployment with kubectl:

```bash
kubectl apply -f kubernetes/app-deployment.yaml
```

You now should see the pod running take note of the pod name

```bash
kubectl get pods
```

```bash
kubectl describe pod [pod name]
```

```bash
kubectl logs [pod name]
```
Should provide you with the pods details

```
 * Serving Flask app 'app' (lazy loading)
 * Environment: production
   WARNING: This is a development server. Do not use it in a production deployment.
   Use a production WSGI server instead.
 deployment. Use a production WSGI server instead.
WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
 * Running on all addresses (0.0.0.0)
 * Running on http://127.0.0.1:5000
 * Running on http://10.244.0.193:5000
Press CTRL+C to quit
 * Restarting with stat
 * Debugger is active!
 * Debugger PIN: 141-889-950
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

Open a browser and navigate to that IP and you should see the app
