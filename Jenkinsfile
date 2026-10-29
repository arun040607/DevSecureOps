
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out DevSecureOps from GitHub'
                checkout scm
            }
        }

        stage('Maven Build and Test') {
            steps {
                echo 'Building the Spring Boot application and running tests'
                bat 'C:\\Tools\\apache-maven-3.10.0\\bin\\mvn.cmd -B clean verify'
            }
        }

        stage('Check Docker') {
            steps {
                echo 'Checking whether Jenkins can access Docker'
                bat '"C:\\Users\\gomat\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" --version'
                bat '"C:\\Users\\gomat\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" info'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building the DevSecureOps Docker image'
                bat '"C:\\Users\\gomat\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" build -t devsecureops:1.0 .'
            }
        }
    }

    post {
        success {
            echo 'DevSecureOps pipeline completed successfully!'
        }

        failure {
            echo 'Pipeline failed. Check the Console Output for the exact error.'
        }

        always {
            echo 'DevSecureOps pipeline execution finished.'
        }
    }
}
