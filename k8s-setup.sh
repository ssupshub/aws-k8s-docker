#!/bin/bash

# Update and install necessary packages
apt-get update && apt-get upgrade -y

# Install Docker (if not installed already)
if ! command -v docker &> /dev/null
then
    apt-get install -y docker.io
fi

# Initialize Kubernetes using kubeadm
kubeadm init --pod-network-cidr=10.244.0.0/16

# Set up kubeconfig
export KUBEVIRT_VERSION=0.45.0
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

# Install a pod network add-on (Flannel)
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

# To allow the worker nodes to join the cluster, untaint the master node
kubectl taint nodes --all node-role.kubernetes.io/master-

# Kubernetes is now set up in Docker inside Ubuntu!
