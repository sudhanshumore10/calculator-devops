# 🚀 Calculator DevOps CI/CD Pipeline Project

A complete end-to-end DevOps project demonstrating the implementation of a CI/CD pipeline for a Spring Boot application using Jenkins, SonarQube, Docker, Terraform, Amazon ECR, Amazon ECS, and GitHub Webhooks.

---

# 📖 Overview

This project demonstrates how modern DevOps practices can automate the software delivery lifecycle from source code commit to production deployment.

The project uses a simple Spring Boot Calculator Application as the workload while focusing on building a production-style CI/CD pipeline and cloud infrastructure.

The primary objective is to automate:

* Application Build
* Automated Testing
* Code Quality Analysis
* Containerization
* Infrastructure Provisioning
* Container Registry Management
* Continuous Deployment
* Cloud Infrastructure Management

The entire infrastructure is provisioned using Terraform, making the deployment reproducible, scalable, and version-controlled.

---

# 🎯 Project Objective

Traditional application deployment involves multiple manual steps that are prone to human error.

This project automates the complete deployment workflow by implementing:

* Continuous Integration (CI)
* Continuous Delivery/Deployment (CD)
* Infrastructure as Code (IaC)
* Automated Code Quality Checks
* Docker Containerization
* AWS Cloud Deployment
* Automated Rolling Updates

---

# 🏗️ Project Architecture

![Architecture-Pipeline-1](https://github.com/user-attachments/assets/5081b581-8cf2-46e7-bc9e-9da51fe48624)

### Pipeline Flow

```text
Developer
    │
    ▼
GitHub Repository
    │
    ▼
GitHub Webhook
    │
    ▼
Jenkins Pipeline
    │
 ┌──┼──────────────────────┐
 ▼  ▼                      ▼
Build Test           SonarQube Analysis
    │                      │
    └──────────────┬───────┘
                   ▼
            Quality Gate
                   │
          Pass     │     Fail
           ▼       │
    Docker Build   │
           │       │
           ▼       │
      Push to ECR  │
           │       │
           ▼       │
      Deploy ECS   │
           │       │
           ▼       │
    Running Application
```

---

# 🏗️ 7 Phases of Implementation

## 🔹 Phase 1 – Application Development

Developed a Spring Boot Calculator REST API.

### Features

* Addition
* Subtraction
* Multiplication
* Division

### REST Endpoints

```http
/api/add
/api/subtract
/api/multiply
/api/divide
```

### Testing

Implemented comprehensive JUnit test cases covering:

* Positive inputs
* Negative inputs
* Zero values
* Edge cases
* Application context validation

Total Tests: 21

---

## 🔹 Phase 2 – Infrastructure Provisioning (Terraform)

Provisioned AWS infrastructure using Terraform.

### Resources Created

* VPC
* Public Subnet
* Internet Gateway
* Route Tables
* Security Groups
* IAM Roles
* EC2 Instances
* ECR Repository
* ECS Cluster
* ECS Service

### Benefits

* Infrastructure as Code
* Reproducible deployments
* Version-controlled infrastructure
* Automated provisioning

---

## 🔹 Phase 3 – Jenkins Setup

Configured Jenkins as the CI/CD orchestration platform.

### Installed Components

* Git
* Maven
* Docker
* AWS CLI

### IAM Permissions

Configured Jenkins for:

* Amazon ECR access
* ECS deployment permissions
* Infrastructure interaction

---

## 🔹 Phase 4 – Continuous Integration Pipeline

Implemented Jenkins Pipeline as Code.

### Pipeline Stages

1. Checkout Source Code
2. Maven Build
3. Unit Testing
4. SonarQube Analysis
5. Quality Gate Validation

### Trigger Mechanism

GitHub Webhooks automatically trigger builds whenever code is pushed.

---

## 🔹 Phase 5 – Code Quality & Static Analysis

Integrated SonarQube for continuous code quality monitoring.

### Quality Checks

* Bugs
* Vulnerabilities
* Code Smells
* Test Coverage
* Maintainability Issues

### Quality Gate

Deployment proceeds only when the Quality Gate passes.

If the gate fails:

```text
Build → Test → SonarQube → FAIL
                         ↓
                 Deployment Blocked
```

---

## 🔹 Phase 6 – Containerization & Registry

Dockerized the Spring Boot application.

### Docker Features

* Consistent runtime environment
* Portable deployment
* Easy scaling
* Immutable deployments

### Image Tagging Strategy

```text
calculator-repo:latest
calculator-repo:20260221051357
```

### Registry

Amazon Elastic Container Registry (ECR)

Stores:

* Latest image
* Historical image versions

---

## 🔹 Phase 7 – Continuous Deployment (ECS)

Implemented automated deployment using Amazon ECS (EC2 Launch Type).

### Deployment Process

Jenkins executes:

```bash
aws ecs update-service --force-new-deployment
```

ECS then:

* Pulls latest image from ECR
* Replaces old container
* Starts new container
* Maintains service availability

### Deployment Characteristics

* Rolling deployment
* Minimal downtime
* Automated container replacement

---

# 🔁 Automated Workflow

```text
Developer Pushes Code
          │
          ▼
GitHub Webhook Trigger
          │
          ▼
Jenkins Pipeline
          │
          ▼
Build & Unit Tests
          │
          ▼
SonarQube Analysis
          │
          ▼
Quality Gate Check
          │
          ▼
Docker Build
          │
          ▼
Push Image to ECR
          │
          ▼
ECS Deployment
          │
          ▼
Application Updated
```

---

# 🧠 Key DevOps Concepts Implemented

* Continuous Integration (CI)
* Continuous Deployment (CD)
* Infrastructure as Code (Terraform)
* GitOps Workflow
* Docker Containerization
* Automated Testing
* Static Code Analysis
* Quality Gate Enforcement
* Container Registry Management
* Rolling Deployment Strategy
* AWS Cloud Deployment
* Immutable Infrastructure

---

# ☁️ AWS Services Used

| Service         | Purpose                              |
| --------------- | ------------------------------------ |
| EC2             | Jenkins, SonarQube, ECS Worker Nodes |
| ECR             | Docker Image Registry                |
| ECS             | Container Orchestration              |
| IAM             | Access Management                    |
| VPC             | Networking                           |
| Security Groups | Firewall Rules                       |

---

# 🛠️ Technology Stack

## Backend

* Java 17
* Spring Boot
* Maven
* JUnit

## DevOps

* Git
* GitHub
* Jenkins
* SonarQube
* Docker
* Terraform

## Cloud

* AWS EC2
* AWS ECR
* AWS ECS
* IAM
* VPC

## Development Tools

* VS Code
* Docker Desktop
* Git Bash
* PowerShell
* WSL2

---

# 📂 Repository Structure

```bash
calculator/
│
├── src/
├── Dockerfile
├── Jenkinsfile
├── pom.xml
└── terraform/
    ├── provider.tf
    ├── vpc.tf
    ├── ec2_jenkins.tf
    ├── ec2_sonar.tf
    ├── ecs.tf
    ├── ecr.tf
    └── iam.tf
```

---

# 🏁 Final Outcome

✔ Fully automated CI/CD pipeline

✔ Infrastructure provisioned via Terraform

✔ Automated code quality validation

✔ Docker image versioning strategy

✔ Amazon ECR integration

✔ Automatic ECS deployment

✔ Zero manual deployment steps

✔ Production-style DevOps workflow

---

# 👨‍💻 Author

**Sudhanshu More**

GitHub: https://github.com/sudhanshumore10

---

# 📄 License

This project was developed for educational and learning purposes to demonstrate modern DevOps practices including CI/CD, Infrastructure as Code, containerization, cloud deployment, and automation.
