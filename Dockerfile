# Use the official Ubuntu base image
FROM ubuntu:20.04

# Set environment variables to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies for Kubernetes and Docker
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y apt-transport-https ca-certificates curl software-properties-common \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - \
    && echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list \
    && apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io \
    && curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - \
    && echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list \
    && apt-get update && apt-get install -y kubelet kubeadm kubectl kubernetes-cni \
    && apt-mark hold kubelet kubeadm kubectl

# Install Docker Compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

# Expose port for Kubernetes API server (default is 8080)
EXPOSE 8080

# Run a Kubernetes setup script (k8s-setup.sh) when the container starts
COPY k8s-setup.sh /usr/local/bin/k8s-setup.sh
RUN chmod +x /usr/local/bin/k8s-setup.sh

CMD ["/usr/local/bin/k8s-setup.sh"]
