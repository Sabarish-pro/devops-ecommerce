
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
                sh 'python3 -m pytest -v'
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
    }
}

