pipeline {

    agent any

    tools {
        maven 'mvn',
        docker 'docker'
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

        stage('build image') {
            steps {
                sh "docker build -t bhanuka222/cloudev-edu-jan:latest ."
            }
        }

        stage('push image') {
            steps {
                sh "docker push bhanuka222/cloudev-edu-jan:latest"
            }
        }
    }
}




