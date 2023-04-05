#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
    MY_VAR = "my-value"
    AWS_REGION = "us-east-1"
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
                    // sh '''docker version
                    // docker info
                    // docker compose version
                    // curl --version
                    // jg --version '''
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