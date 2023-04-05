#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
    MY_VAR = "my-value"
    AWS_REGION = "us-east-1"
    PATH = "$PATH:/usr/local/bin"
  }
    stages {
        stage('hello AWS') {
            steps {
              withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'test-id',
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                ]]) {
                     sh 'chmod +x /usr/local/bin/docker-compose'
                     sh 'docker-compose up -d'
                     sh 'bash deploy.sh $AWS_ACCESS_KEY_ID $AWS_SECRET_ACCESS_KEY'
                }
            }
        }
        
        stage('Test') {
            steps {
                echo 'Testing...'
            }
        }
    }
    post {
        success {
            echo 'Development Deployed...'
        }
        failure {
              echo 'Failed to Deploy...'
        }
    }
}