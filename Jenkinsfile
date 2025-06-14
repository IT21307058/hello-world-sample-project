pipeline {

    agent any

    environment {
        DOCKER_CREDENTIALS_ID = 'dockerhub'
        IMAGE_NAME = 'isurupathumherath/hello-world:latest'
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

        // stage('install') {
        //     steps {
        //         sh "mvn install -DskipTests"
        //     }
        // }

        stage('package') {
            steps {
                sh "mvn package -DskipTests"
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    sh "docker build -t $IMAGE_NAME ."
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS_ID) {
                        sh "docker push $IMAGE_NAME"
                    }
                }
            }
        }

    }
}
