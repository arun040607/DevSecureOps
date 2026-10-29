
pipeline {
    agent any

    stages {
        stage('Configure Java 21') {
            steps {
                script {
                    env.JAVA_HOME = 'C:\\Program Files\\Eclipse Adoptium\\jdk-21.0.9.10-hotspot'
                    env.PATH = "${env.JAVA_HOME}\\bin;${env.PATH}"
                }

                bat 'echo JAVA_HOME=%JAVA_HOME%'
                bat 'where java'
                bat 'java -version'
            }
        }

        stage('Check Maven') {
            steps {
                bat 'C:\\Tools\\apache-maven-3.10.0\\bin\\mvn.cmd -version'
            }
        }
    }
}
