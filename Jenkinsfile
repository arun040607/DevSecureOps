
pipeline {
    agent any

    stages {
        stage('Configure Java 21') {
            steps {
                script {
                    env.JAVA_HOME = 'C:\\Program Files\\Eclipse Adoptium\\jdk-21.0.9.10-hotspot'
                    env.PATH = "${env.JAVA_HOME}\\bin;${env.PATH}"
                }
                bat 'java -version'
            }
        }

        stage('Checkout') {
            steps {
                echo 'Checking out DevSecureOps'
                checkout scm
            }
        }

        stage('Maven Build and Test') {
            steps {
                echo 'Running Maven verification and tests'
                bat 'C:\\Tools\\apache-maven-3.10.0\\bin\\mvn.cmd -B clean verify'
            }
        }

        stage('Check Docker') {
            steps {
                echo 'Checking Docker CLI and engine'
                bat '"C:\\Users\\gomat\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" --version'
                bat '"C:\\Users\\gomat\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" info'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building DevSecureOps Docker image'
                bat '"C:\\Users\\gomat\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" build -t devsecureops:1.0 .'
            }
        }
    }

    post {
        success {
            echo 'DevSecureOps pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check Console Output for the failing stage.'
        }
        always {
            echo 'DevSecureOps pipeline execution finished.'
        }
    }
}
