pipeline {
	agent any
	

	environment {
		IMAGE_NAME = 'devops-ecommerce:ci'
	}


	stages {
		stage('Checkout') {
			steps {
				checkout scm
			}
	}

	stage('Build Docker Image') {
		steps {
			sh 'docker build -t devops-ecommerce:ci .'
		}
	}

	stage('Trivy Security scan') {
		steps {
			sh 'trivy image --scanners vuln devops-ecommerce:ci'
		}
	}
		
     }	

   }

}
