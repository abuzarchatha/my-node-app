# Node.js CI/CD Pipeline with GitHub Actions & AWS App Runner

## Overview
This project demonstrates a **production-ready CI/CD pipeline** for a Node.js application using **GitHub Actions**, **Docker**, and **AWS App Runner**.

The pipeline automatically:
- Builds and tests the application
- Creates a Docker image
- Pushes the image to Amazon ECR
- Scans the image for vulnerabilities
- Deploys the application to AWS App Runner

The goal is to achieve **fully automated deployments** with minimal infrastructure management.

---

## Why this project exists
Manual deployments are:
- Error-prone
- Time-consuming
- Not scalable

This project solves those problems by implementing:
- Continuous Integration (CI)
- Continuous Deployment (CD)
- Infrastructure abstraction using managed AWS services

Once configured, developers only need to **push code** — everything else is handled automatically.

---

## Architecture Overview

```text
Developer Pushes Code
        ↓
GitHub Actions CI/CD
        ↓
Install Dependencies & Run Tests
        ↓
Build Docker Image
        ↓
Push Image to Amazon ECR
        ↓
Security Scan (Trivy)
        ↓
Deploy / Update AWS App Runner Service
