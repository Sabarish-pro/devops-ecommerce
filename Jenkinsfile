
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Test') {
            steps {
                sh '''
                    python3 -m venv .venv
                    .venv/bin/python -m pip install --upgrade pip
                    .venv/bin/python -m pip install -r requirements-dev.txt
                    .venv/bin/python -m pytest -v
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t devops-ecommerce:ci .'
            }
        }

        stage('Trivy Security Scan') {
            steps {
                sh 'trivy image --scanners vuln devops-ecommerce:ci'
            }
        }

	stage('Deploy with Docker Compose') {
		steps {
			sh 'docker compose up -d --build'
			sh 'docker compose up'
		}
	}
    }
}

