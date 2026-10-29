pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build and Test') {
            steps {
                bat 'set "JAVA_HOME=C:\\Program Files\\Eclipse Adoptium\\jdk-21.0.9.10-hotspot" && "C:\\Tools\\apache-maven-3.10.0\\bin\\mvn.cmd" -B clean verify'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t devsecureops:1.0 .'
            }
        }
    }

    post {
        success {
            echo 'DevSecureOps pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check the stage logs before deploying.'
        }
    }
}
