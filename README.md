# 🛠️ Fullstack DevOps Project: NestJS + React + Jenkins + Kubernetes

This project demonstrates a fullstack microservices architecture with a NestJS backend and React frontend, integrated into a complete CI/CD pipeline using **Jenkins**, **Docker**, and **Kubernetes (KIND)**.

## 📦 Tech Stack

- **Backend**: NestJS (monorepo, microservices)
- **Frontend**: React
- **CI/CD**: Jenkins Pipeline
- **Security Scans**: Trivy, OWASP Dependency Check
- **Containerization**: Docker, Docker Compose
- **Orchestration**: Kubernetes (using KIND for local cluster)
- **Ingress**: NGINX with custom domain (`local-k8s.souravcodes.in`)

---

## 🚀 Features

- 🔄 **Full CI/CD Pipeline**
  - Automatic build, scan, test, and deploy stages
  - Docker image tagging and pushing to Docker Hub

- 🧪 **Security Integration**
  - OWASP Dependency Check for backend dependencies
  - Trivy image scan for vulnerabilities

- 📦 **Multi-Service Support**
  - API Gateway
  - Booking Service
  - Admin Service

- 🧰 **Kubernetes-Based Deployment**
  - KIND cluster for local K8s simulation
  - Ingress configured to access via `local-k8s.souravcodes.in`

---

## 📁 Project Structure












---

## 🧪 Jenkins Pipeline

The pipeline includes the following stages:

1. **Clean Workspace**
2. **Checkout Code**
3. **Install Dependencies** (inside Docker)
4. **OWASP Dependency Check**
5. **SonarQube Analysis**
6. **Docker Build & Tag**
7. **Trivy Image Scan**
8. **Push Docker Images**
9. **Deploy to KIND Cluster**
10. *(Optional)* Port forwarding or domain access via `local-k8s.souravcodes.in`

---

## 🌐 Access Application

After deployment:

- **API Gateway**:  
  Via Ingress: `http://local-k8s.souravcodes.in/api/...`  
  Or via NodePort: `http://localhost:30080`

- Update your local `/etc/hosts`:

  ```bash
  sudo nano /etc/hosts
Add 127.0.0.1  127.0.0.1  k8s.local




