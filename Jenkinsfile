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

        tage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh """
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker push $IMAGE_NAME
                        docker logout
                    """
                }
            }
}

    }
}
