🚀 Calculator DevOps CI/CD Project

This project demonstrates a complete end-to-end DevOps CI/CD pipeline using:

Spring Boot

Maven

Jenkins

SonarQube

Docker

Amazon ECR

Amazon ECS (EC2 Launch Type)

Terraform (Infrastructure as Code)

GitHub Webhooks

📌 Project Architecture

![Architecture-Pipeline-1](https://github.com/user-attachments/assets/5081b581-8cf2-46e7-bc9e-9da51fe48624)


Flow:

Developer → Git Push → Webhook → Jenkins → Build → Test → SonarQube → Quality Gate → Docker Build → Push to ECR → Deploy to ECS → Application Running

Infrastructure is provisioned using Terraform.



🏗 7 Phases of Implementation
🔹 Phase 1 – Application Development

Developed a simple Spring Boot Calculator API

REST endpoints:

/add

/subtract

/multiply

/divide

Built using Maven

Packaged as executable JAR


🔹 Phase 2 – Infrastructure Provisioning (Terraform)

Provisioned AWS infrastructure using Terraform:

VPC

Public Subnet

Internet Gateway

Security Groups

IAM Roles

EC2 (Jenkins)

EC2 (SonarQube)

EC2 (ECS Node)

ECR Repository

ECS Cluster & Service

Terraform ensures infrastructure is reproducible and version-controlled.


🔹 Phase 3 – Jenkins Setup (CI Server)

Installed Jenkins on EC2

Configured:

Git

Maven

Docker

AWS CLI

Configured IAM role for:

ECR access

ECS update permissions

Jenkins acts as the CI/CD orchestrator.


🔹 Phase 4 – Continuous Integration Pipeline

Created Jenkins Pipeline with stages:

Checkout Code

Build (Maven)

Unit Test

SonarQube Analysis

Quality Gate Validation

Pipeline is triggered automatically via GitHub Webhook.


🔹 Phase 5 – Code Quality & Quality Gate

Integrated SonarQube:

Static Code Analysis

Bug detection

Code Smell detection

Coverage monitoring

Quality Gate enforcement

Pipeline waits for Quality Gate result before deployment.

If gate fails → deployment stops.


🔹 Phase 6 – Containerization & Registry

Dockerized Spring Boot application

Image tagging strategy:

timestamp

latest

Pushed images to:

Amazon ECR

Example tagging format:

calculator-repo:20260221051357
calculator-repo:latest


🔹 Phase 7 – Continuous Deployment (ECS)

ECS Cluster (EC2 Launch Type)

Desired Count: 1

Jenkins triggers:

aws ecs update-service --force-new-deployment

ECS:

Pulls latest image from ECR

Replaces old container

Runs new version

Application publicly accessible on port 8080



🔁 Automated Flow

Developer pushes code to GitHub

GitHub Webhook triggers Jenkins

Jenkins runs pipeline

SonarQube validates code quality

Docker image is built

Image pushed to ECR

ECS deploys updated container

Application updated automatically



🧠 Key DevOps Concepts Implemented

Infrastructure as Code (Terraform)

CI/CD Automation

Webhook Triggering

Code Quality Gates

Docker Image Versioning

AWS IAM Roles & Security

ECS Rolling Deployment

Immutable Infrastructure Concept



☁️ AWS Services Used

EC2

ECR

ECS

IAM

VPC

Security Groups


📂 Repository Structure
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


🏁 Final Outcome

✔ Fully automated CI/CD pipeline
✔ Infrastructure provisioned via Terraform
✔ Quality Gate enforced
✔ Docker image versioned
✔ Automatic ECS deployment
✔ Zero manual deployment steps


👨‍💻 Author

Sudhanshu More
