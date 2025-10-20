
# Running Kubernetes in Docker on Ubuntu EC2 (AWS)

## 1. Launch Ubuntu EC2

- Use Ubuntu 20.04 or later AMI
- t3.medium recommended for memory
- Open ports: 22 (SSH), optionally 6443 (K8s API), 30000-32767 (NodePort)

## 2. SSH into instance

```bash
ssh -i your-key.pem ubuntu@your-ec2-ip
````

## 3. Install Docker

```bash
sudo apt-get update
sudo apt-get install -y docker.io
sudo usermod -aG docker $USER
newgrp docker
```

## 4. Clone and build the container

```bash
git clone https://github.com/your-username/ubuntu-aws-k8s-docker.git
cd ubuntu-aws-k8s-docker
docker build -t kind-k8s .
```

## 5. Run the container with Docker-in-Docker enabled

```bash
docker run --privileged --name=k8s-container -it kind-k8s
```

## 6. Access the Kubernetes cluster

Inside the container:

```bash
kubectl get nodes
```
---
