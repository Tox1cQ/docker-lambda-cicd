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

    }
}
