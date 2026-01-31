pipeline {

    agent any

    tools {
        maven 'mvn'
    }

    environment {
        IMAGE_NAME = "bhanuka222/cloudev-edu-jan:latest"
        PROD_IP = "44.203.42.138"
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

        stage('deploy to prod') {
            steps {
                sshagent(['ec2-ssh-key']) {
                    // This command runs ON THE REMOTE SERVER via SSH
                    sh """
                        ssh -o StrictHostKeyChecking=no ubuntu@${PROD_IP} '
                            docker pull ${IMAGE_NAME}
                            docker stop my-app || true
                            docker rm my-app || true
                            docker run -d --name my-app -p 80:8080 ${IMAGE_NAME}
                        '
                    """
                }
            }
        }
    }
}




