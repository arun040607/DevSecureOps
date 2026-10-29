pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps { checkout scm }
        }
        stage('Build and Test') {
            steps {
                sh 'mvn -B clean verify'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t devsecureops:1.0 .'
            }
        }
    }
    post {
        success { echo 'CI pipeline passed: tests succeeded and Docker image was built.' }
        failure { echo 'Pipeline failed. Check the stage logs before deploying.' }
    }
}
