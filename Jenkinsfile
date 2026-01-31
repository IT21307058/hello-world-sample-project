pipeline {

    agent any

    tools {
        maven 'mvn'
    }

    environment {
        IMAGE_NAME = "bhanuka222/cloudev-edu-jan:latest"
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
                withCredentials([usernamePassword(credentialsId: 'DOCKERHUB_CREDENTIALS', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                sh "echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin"

                sh "docker push $IMAGE_NAME"
                
                sh "docker logout"
                }
            }
        }
    }
}




