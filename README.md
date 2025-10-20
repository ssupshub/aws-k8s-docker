# Kubernetes in Docker on Ubuntu EC2 (AWS)

This project sets up a lightweight Kubernetes cluster using [kind (Kubernetes IN Docker)](https://kind.sigs.k8s.io/) inside a Docker container, running on an Ubuntu EC2 instance in AWS.

## Why use kind?
- Designed to run Kubernetes in Docker containers
- Easy to test K8s workloads without full cluster setup
- Supported by Kubernetes community

## Steps

1. Launch Ubuntu EC2 instance on AWS
2. SSH into the instance
3. Install Docker and clone this repo
4. Build and run the container
5. Access the Kubernetes cluster using `kubectl`

