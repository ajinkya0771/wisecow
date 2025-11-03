# 🐮 Wisecow – Kubernetes Deployment with CI/CD & TLS

## 🚀 Project Overview

This project is part of the ''DevOps Trainee program''.  
The goal was to **containerize**, **deploy**, and **secure** the Wisecow application on a Kubernetes cluster with automated CI/CD integration using GitHub Actions.

---

## 🧩 Problem Statement

**Objective:**  
Containerize and deploy the [Wisecow](https://github.com/nyrahul/wisecow) web server application using Kubernetes and enable secure HTTPS (TLS) communication.

---

## ✅ Achievements Summary

| Component | Status | Description |
|------------|--------|-------------|
| 🐳 **Dockerization** | ✅ Completed | Dockerfile created to containerize the Wisecow app |
| ☸️ **Kubernetes Deployment** | ✅ Completed | Deployment, Service, and Namespace manifests created |
| 🌐 **Ingress + TLS** | ✅ Completed | Configured Ingress with self-signed TLS for HTTPS |
| ⚙️ **CI/CD (GitHub Actions)** | ✅ Completed | Automates build and push of Docker image to registry |
| 📦 **Repository** | ✅ Public | [ajinkya0771/wisecow](https://github.com/ajinkya0771/wisecow) |
| 📸 **Verification Screenshot** | ✅ Done | HTTPS working at `https://wisecow.local` |

---

## 🧱 Repository Structure





# Cow wisdom web server

## Prerequisites

```
sudo apt install fortune-mod cowsay -y
```

## How to use?

1. Run `./wisecow.sh`
2. Point the browser to server port (default 4499)

## What to expect?
![wisecow](https://github.com/nyrahul/wisecow/assets/9133227/8d6bfde3-4a5a-480e-8d55-3fef60300d98)

# Problem Statement
Deploy the wisecow application as a k8s app

## Requirement
1. Create Dockerfile for the image and corresponding k8s manifest to deploy in k8s env. The wisecow service should be exposed as k8s service.
2. Github action for creating new image when changes are made to this repo
3. [Challenge goal]: Enable secure TLS communication for the wisecow app.

## Expected Artifacts
1. Github repo containing the app with corresponding dockerfile, k8s manifest, any other artifacts needed.
2. Github repo with corresponding github action.
3. Github repo should be kept private and the access should be enabled for following github IDs: nyrahul
Trigger CI/CD
