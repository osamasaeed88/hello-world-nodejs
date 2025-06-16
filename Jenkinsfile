pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
        IMAGE_NAME = 'nodejs-app'
        ECR_REPO = '211125346130.dkr.ecr.us-east-1.amazonaws.com/task/node-app'
        DOCKER_IMAGE = "${ECR_REPO}:latest"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/osamasaeed88/hello-world-nodejs.git'
            }
        }

        stage('Build App') {
            steps {
                sh 'npm install'
            }
        }

        stage('Unit Test') {
            steps {
                sh 'npm test' // or your test command
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Login to ECR') {
            steps {
                sh 'aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_REPO'
            }
        }

        stage('Push to ECR') {
            steps {
                sh """
                    docker tag ${IMAGE_NAME}:latest ${DOCKER_IMAGE}
                    docker push ${DOCKER_IMAGE}
                """
            }
        }

        stage('Trigger Ansible Deployment') {
            steps {
                sh '''
                  bash -c "
                   source ~/.ansible-venv/bin/activate
                   export ANSIBLE_HOST_KEY_CHECKING=False
                   ansible-playbook -i inventory bootstrap.yml
                   ansible-playbook -i inventory deploy.yml
                  "
                '''
            }
        }
    }
}
