# Setting up Ubuntu EC2 on AWS

1. **Launch an EC2 Instance:**
   - Go to AWS EC2 dashboard and launch a new EC2 instance.
   - Choose an Ubuntu-based AMI (e.g., `ubuntu-20.04`).
   - Select instance type (t2.micro should be sufficient for testing).
   - Configure security group to allow SSH (port 22) and any ports Kubernetes needs (default 6443 for Kubernetes API).

2. **Connect to EC2 Instance via SSH:**
   ```bash
   ssh -i your-key.pem ubuntu@<EC2_PUBLIC_IP>
