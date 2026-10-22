# Containerized E-Commerce Application with CI/CD

## Project Overview
Built and deployed a Flask-based e-commerce web application using Docker and Docker Compose. Automated testing, container image building, vulnerability scanning, and deployment using a Jenkins CI/CD pipeline.

## Technologies Used
- **Application:** Python, Flask, Gunicorn
- **Containerization:** Docker, Docker Compose
- **CI/CD:** Jenkins
- **Testing:** Pytest
- **Security Scanning:** Trivy
- **Version Control:** Git, GitHub

## Architecture
GitHub → Jenkins Checkout → Pytest → Docker Image Build → Trivy Vulnerability Scan → Docker Compose Deployment → Health Check

## Key Features
- Containerized Flask application using a multi-stage Dockerfile.
- Automated application tests with Pytest.
- Automated Docker image builds through Jenkins.
- Vulnerability scanning with Trivy.
- Deployment and container management using Docker Compose.
- Health-check endpoint at `/health`.
- Runs the application as a non-root user.

## Run Locally

Build and start the application:

```bash
docker compose up -d --build
```

Check container status:

```bash
docker compose ps
```

Test the health endpoint:

```bash
curl -i http://localhost:5003/health
```

The local Compose port may differ from the Jenkins deployment port.

## Jenkins CI/CD Pipeline
1. Checkout source code from GitHub.
2. Install test dependencies and execute Pytest.
3. Build the Docker image.
4. Scan the image for vulnerabilities using Trivy.
5. Deploy the application using Docker Compose.
6. Verify deployment using the `/health` endpoint.

## Deployment Verification
The Jenkins deployment was verified successfully. The container reached a healthy state, and the `/health` endpoint returned HTTP `200 OK` with the response `OK`.

## Repository
https://github.com/Sabarish-pro/devops-ecommerce

