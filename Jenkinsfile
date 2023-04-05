#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
    MY_VAR = "my-value"
  }
    stages {
        stage('Build') {
            steps {
                // sh 'ls'
                 sh './deploy.sh \$MY_VAR'
                echo 'Testing...'
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