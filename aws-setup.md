
# Setting up Ubuntu EC2 on AWS

1. **Launch an EC2 Instance:**
   - Go to AWS EC2 dashboard and launch a new EC2 instance.
   - Choose an Ubuntu-based AMI (e.g., `ubuntu-20.04`).
   - Select instance type (t2.micro should be sufficient for testing).
   - Configure security group to allow SSH (port 22) and any ports Kubernetes needs (default 6443 for Kubernetes API).

2. **Connect to EC2 Instance via SSH:**
   ```bash
   ssh -i your-key.pem ubuntu@<EC2_PUBLIC_IP>
   ```

3. **Install Docker and Docker Compose:**

   * Ensure that Docker and Docker Compose are installed. If not, you can install them with the following:

   ```bash
   sudo apt-get update
   sudo apt-get install -y docker.io
   sudo apt-get install -y docker-compose
   ```

4. **Clone the repository and build the Docker image:**

   ```bash
   git clone https://github.com/your-username/ubuntu-aws-k8s-docker.git
   cd ubuntu-aws-k8s-docker
   docker build -t ubuntu-k8s-docker .
   ```

5. **Run the container:**

   ```bash
   docker run -d --name=k8s-container ubuntu-k8s-docker
   ```

Your Kubernetes cluster should now be up and running inside the Docker container.

```

---

These are the files you need, with the content provided. You can now create and push them to your GitHub repository. Let me know if you need any further help!
```
