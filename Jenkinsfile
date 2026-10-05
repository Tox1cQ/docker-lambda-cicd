pipeline {

    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform -chdir=terraform init'
            }
        }

        stage('Terraform Format') {
            steps {
                sh 'terraform -chdir=terraform fmt'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform -chdir=terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform -chdir=terraform plan'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t addition-lambda-cicd:1.0 .'
            }
        }

        stage('Docker Tag') {
            steps {
                sh '''
                    docker tag addition-lambda-cicd:1.0 \
                    556957333990.dkr.ecr.ap-south-1.amazonaws.com/addition-lambda-cicd:1.0
                '''
            }
        }

        stage('Docker Push') {
            steps {
                sh '''
                    aws ecr get-login-password --region ap-south-1 | \
                    docker login --username AWS --password-stdin \
                    556957333990.dkr.ecr.ap-south-1.amazonaws.com

                    docker push \
                    556957333990.dkr.ecr.ap-south-1.amazonaws.com/addition-lambda-cicd:1.0
                '''
            }
        }

    }
}
