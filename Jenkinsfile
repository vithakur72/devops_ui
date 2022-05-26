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
                git branch: 'main',
                url: ' https://github.com/vithakur72/devops_ui.git'
                echo 'Did we get the source?'
                sh 'ls -a'
                echo 'install dependencies'
                sh 'npm install'
                echo 'Run tests'
                // -- --watchAll=false flag ensures react tests exit
                sh 'npm test -- --watchAll=false'
                echo 'Tests passed on to build and deploy Docker container'
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
            //steps {
             //}
        }     
        stage('Remove local docker image') {
            steps{
                sh "docker rmi $imageName:latest"
                sh "docker rmi $imageName:$BUILD_NUMBER"
            }
        }
    }
}