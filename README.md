# Flask E-Commerce DevOps Project

A Flask web application with a containerized deployment workflow.

## Technology Stack
- Python and Flask
- Git and GitHub
- Docker
- Docker Compose
- Gunicorn

## Project Features
- Containerized Flask application
- Docker image built from a version-controlled Dockerfile
- Docker Compose configuration for repeatable deployment
- Application health endpoint for deployment verification

## Run Locally with Docker

Build the image:

```bash
docker build -t devops-ecommerce:2.0 .
```

Run the container:

```bash
docker run -d --name ecommerce-app -p 5003:5000 devops-ecommerce:2.0
```

Verify the health endpoint:

```bash
curl http://127.0.0.1:5003/health
```

## Future Improvements
- Jenkins CI/CD pipeline
- Trivy container image scanning
- Automated testing
- Deployment monitoring and logging
