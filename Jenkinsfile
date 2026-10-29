
pipeline {
    agent any

    stages {
        stage('Check Java Environment') {
            steps {
                bat 'echo JAVA_HOME=%JAVA_HOME%'
                bat 'where java'
                bat 'java -version'
                bat 'echo PATH=%PATH%'
            }
        }

        stage('Check Maven') {
            steps {
                bat 'C:\\Tools\\apache-maven-3.10.0\\bin\\mvn.cmd -version'
            }
        }
    }
}
