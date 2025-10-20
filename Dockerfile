FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install basic tools
RUN apt-get update && apt-get install -y \
    curl apt-transport-https ca-certificates gnupg lsb-release \
    docker.io git sudo

# Install Go (needed for kind sometimes)
RUN curl -OL https://golang.org/dl/go1.20.5.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.20.5.linux-amd64.tar.gz && \
    ln -s /usr/local/go/bin/go /usr/bin/go && \
    rm go1.20.5.linux-amd64.tar.gz

# Install kind
RUN curl -Lo /usr/local/bin/kind https://kind.sigs.k8s.io/dl/v0.22.0/kind-linux-amd64 && \
    chmod +x /usr/local/bin/kind

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    rm kubectl

# Copy setup script
COPY k8s-setup.sh /usr/local/bin/k8s-setup.sh
RUN chmod +x /usr/local/bin/k8s-setup.sh

CMD ["/usr/local/bin/k8s-setup.sh"]
