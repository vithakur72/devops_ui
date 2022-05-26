pipeline {
    agent any 
    environment {
        registryCredential = 'docker'
        imageName = 'vithakur72/ext-1'
        dockerImage = ''
        }
    stages {
        stage('Run the tests') {
             agent {
                docker { 
                    image 'node:14-alpine'
                    args '-e HOME=/tmp -e NPM_CONFIG_PREFIX=/tmp/.npm'
                    reuseNode true
                }
            }
            steps {
                echo 'Retrieve source from github. run npm install and npm test' 
                git branch: 'master',
                    url: 'https://github.com/vithakur72/devops_ui.git'
                echo 'repo files'
                sh 'ls -a'
            }
        }
        stage('Building image') {
            steps{
                script {
                    echo 'build the image' 
                }
            }
            }
        stage('Push Image') {
            steps{
                script {
                    echo 'push the image to docker hub' 
                }
            }
        }     
         stage('deploy to k8s') {
             agent {
                docker { 
                    image 'google/cloud-sdk:latest'
                    args '-e HOME=/tmp'
                    reuseNode true
                        }
                    }
            steps {
                script {
                    echo 'push the image to docker hub' 
                }
             }
        }     
        stage('Remove local docker image') {
            steps{
                script {
                    echo 'push the image to docker hub' 
                }
                // sh "docker rmi $imageName:latest"
                // sh "docker rmi $imageName:$BUILD_NUMBER"
            }
        }
    }
}