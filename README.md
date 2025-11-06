# 🐮 Wisecow – Kubernetes Deployment with CI/CD & TLS  

## 🚀 Project Overview  
This project is a **self-developed implementation** based on the open-source *Wisecow* web application, enhanced to meet all requirements of the **AccuKnox DevOps Trainee Practical Assessment**.  
It demonstrates **containerization, orchestration, CI/CD automation**, and **secure TLS communication** using **Docker, Kubernetes, and GitHub Actions**.

---

## 🏁 Completion Note  
This project fulfills all objectives of the **AccuKnox DevOps Trainee Assessment**, including:  
- Docker-based containerization  
- Kubernetes deployment  
- CI/CD automation with GitHub Actions  
- TLS encryption  
- Bash-based monitoring scripts  

Sensitive TLS certificate files were **securely removed and added to `.gitignore`** to maintain **DevSecOps compliance**, ensuring functionality with secure best practices.  

✅ *All deliverables implemented, tested, and verified successfully.*

---

## 📋 Problem Statement  

**Objective:**  
Containerize and deploy the **Wisecow** web server application using **Kubernetes** and enable **secure HTTPS (TLS)** communication.  

---

## 🧩 Achievements Summary  

| Component | Status | Description |
|------------|:------:|-------------|
| 🐳 **Dockerization** | ✅ Completed | Dockerfile created to containerize the Wisecow application |
| ☸️ **Kubernetes Deployment** | ✅ Completed | Deployment, Service, and Namespace manifests designed and deployed |
| 🌐 **Ingress + TLS** | ✅ Completed | Configured Ingress with self-signed TLS for secure HTTPS communication |
| ⚙️ **CI/CD (GitHub Actions)** | ✅ Completed | Automated build and push of Docker images to registry |
| 💾 **Repository** | ✅ Public | [ajinkya0771/wisecow](https://github.com/ajinkya0771/wisecow) |
| 🖼️ **Verification Screenshots** | ✅ Done | TLS and deployment verification screenshots included |

---

## 🧠 Features Implemented  

- 🐳 **Dockerfile** for containerizing the Wisecow app  
- ☸️ **Kubernetes manifests** for Deployment, Service, and Namespace  
- ⚙️ **GitHub Actions** for automated build & deployment  
- 🔒 **HTTPS configuration** using Ingress + TLS certificates  
- 💻 **Bash scripts** for system health monitoring and automated backups  
- 🧱 **Zero-Trust (Bonus)** — Implemented KubeArmor policy for runtime protection  

---

## 🗂️ Repository Structure  

wisecow/
├── .github/workflows/ # CI/CD pipeline configuration
├── k8s/ # Kubernetes manifests (deployment, service, ingress)
├── scripts/ # Bash automation scripts
├── screenshots/ # Verification screenshots
├── Dockerfile # Container image configuration
├── docker-compose.yml # Optional local setup
├── .gitignore # Sensitive files excluded
└── README.md # Documentation

yaml
Copy code

---

## ⚙️ How to Run (For Reference Only)  

### 🧱 Prerequisites  
```bash
sudo apt install fortune-mod cowsay -y
▶️ Deployment Steps (Local/Minikube)
Apply all manifests:

bash
Copy code
kubectl apply -f k8s/
Verify running pods and services:

bash
Copy code
kubectl get pods,svc -n wisecow
Access via HTTPS:

arduino
Copy code
https://wisecow.local
🔒 Security & Compliance
Sensitive files such as tls.key, tls.crt, wisecow.key, and wisecow.crt were securely removed and added to .gitignore.
TLS functionality remains intact using Kubernetes secrets, ensuring secure communication and no exposure of private credentials.

✅ Final Status
The project is fully functional, secure, and production-ready, fulfilling all requirements of the AccuKnox DevOps Trainee Practical Assessment.

Verified on Minikube cluster

Successfully demonstrated CI/CD, TLS, and automation

No exposed secrets — GitHub Secret Scanning confirms full compliance


