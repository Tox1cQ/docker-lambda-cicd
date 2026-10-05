pipeline {

    agent any

    environment {
        AWS_REGION = 'ap-south-1'
        ECR_REPOSITORY = 'addition-lambda-cicd'
        ECR_REGISTRY = '556957333990.dkr.ecr.ap-south-1.amazonaws.com'
        IMAGE_TAG = "${BUILD_NUMBER}"
        IMAGE_URI = "${ECR_REGISTRY}/${ECR_REPOSITORY}:${BUILD_NUMBER}"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform -chdir=terraform init -reconfigure -force-copy'
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
                sh 'terraform -chdir=terraform plan -var="image_tag=${IMAGE_TAG}"'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t ${ECR_REPOSITORY}:${IMAGE_TAG} .'
            }
        }

        stage('Docker Tag') {
            steps {
                sh 'docker tag ${ECR_REPOSITORY}:${IMAGE_TAG} ${IMAGE_URI}'
            }
        }

        stage('Docker Push') {
            steps {
                sh '''
                    aws ecr get-login-password --region ${AWS_REGION} | \
                    docker login --username AWS --password-stdin ${ECR_REGISTRY}

                    docker push ${IMAGE_URI}
                '''
            }
        }

        stage('Lambda Deploy') {
            steps {
                sh '''
                    terraform -chdir=terraform apply \
                    -auto-approve \
                    -var="image_tag=${IMAGE_TAG}"
                '''
            }
        }

    }
}
