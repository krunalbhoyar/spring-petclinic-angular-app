pipeline {
    agent any

    stages {
        stage('cloning code from git') {
            steps {
                git 'https://github.com/krunalbhoyar/spring-petclinic-angular-app.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'sudo docker --version'
                sh 'sudo docker build -t krunalbhoyar/spring-petclinic-angular:$BUILD_NUMBER .'
                sh 'sudo docker images'
            }
        }
        stage('Push Image to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'DOCKER_HUB_PASSWORD', variable: 'PASSWORD')]) {
                sh 'sudo docker login -u krunalbhoyar -p $PASSWORD'
                }
                sh 'sudo docker push krunalbhoyar/spring-petclinic-angular:$BUILD_NUMBER'
                
            }
        }
    }
}

