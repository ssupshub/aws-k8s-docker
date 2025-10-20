#!/bin/bash

# Start Docker (needed in some environments)
service docker start

# Create kind cluster
kind create cluster --name docker-k8s

# Export kubeconfig
kind get kubeconfig > /root/.kube/config

echo "Kubernetes cluster is running inside Docker!"
echo "Use kubectl to interact with it. Example:"
echo "kubectl get nodes"
