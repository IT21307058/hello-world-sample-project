pipeline {

    agent any

    tools {
        maven 'mvn'
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('clean') {
            steps {
                sh "mvn clean"
            }
        }

        stage('test') {
            steps {
                sh "mvn test"
            }
        }

        stage('package') {
            steps {
                sh "mvn package -DskipTests"
            }
        }

    }
}




