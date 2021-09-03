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
                sh 'docker version'
                sh 'docker build -t spring-petclinic-angular:latest .'
                sh 'docker images'
                sh 'docker tag spring-petclinic-angular:latest krunalbhoyar/spring-petclinic-angular:latest'
            }
        }
        stage('Push Image to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'DOCKER_HUB_PASSWORD', variable: 'PASSWORD')]) {
                sh 'docker login -u krunalbhoyar -p $PASSWORD'
                }
                sh 'docker push krunalbhoyar/spring-petclinic-angular:latest'
                
            }
        }
    }
}

