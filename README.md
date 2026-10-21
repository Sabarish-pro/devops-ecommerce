# Containerized E-Commerce Application with CI/CD

## Project Overview
Containerized a Flask-based e-commerce web application using Docker and Docker Compose. Implemented a Jenkins CI/CD pipeline to automate testing, Docker image building, and Trivy vulnerability scanning.

## Technologies Used
- Linux (Ubuntu)
- Python and Flask
- Docker and Docker Compose
- Jenkins
- Pytest
- Trivy
- Git and GitHub
- Gunicorn

## Architecture
1. Code is maintained in GitHub.
2. Jenkins checks out the repository.
3. Pytest executes automated application tests.
4. Docker builds the application image.
5. Trivy scans the image for known vulnerabilities.
6. Docker Compose runs the application container.

## Run Locally

### Prerequisites
Docker Engine and Docker Compose.

### Start the Application
```bash
git clone https://github.com/Sabarish-pro/devops-ecommerce.git
cd devops-ecommerce
docker compose up -d --build
```

### Verify the Health Endpoint
```bash
curl http://localhost:5003/health
```

Expected response: `OK`

### View Logs and Stop
```bash
docker compose logs -f web
docker compose down
```

## Automated Testing
The project includes pytest tests for the Flask application. Jenkins runs the tests before building and scanning the Docker image.

## Security Scanning
Trivy scans the built image for known vulnerabilities. Findings should be reviewed and addressed according to severity; a successful pipeline does not necessarily mean the image is vulnerability-free.

## Key Learning Outcomes
- Containerized a Python web application.
- Configured Docker Compose service management and health checks.
- Automated testing and image builds through Jenkins.
- Integrated container vulnerability scanning using Trivy.

