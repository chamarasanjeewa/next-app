#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
    MY_VAR = "my-value"
    AWS_REGION = "us-east-1"
  }
    stages {
        stage('Build') {
            steps {
        //      withCredentials([
        //   awsAccessKeyId(credentialsId: 'test-id', variable: 'AWS_ACCESS_KEY_ID'),
        //   awsSecretAccessKey(credentialsId: 'test-id', variable: 'AWS_SECRET_ACCESS_KEY')
        // ]) {
        //         echo 'Building jenkins script.. .$AWS_ACCESS_KEY_ID $AWS_SECRET_ACCESS_KEY '
        //    sh './deploy.sh  $AWS_ACCESS_KEY_ID $AWS_SECRET_ACCESS_KEY'
        // }
        withCredentials([amazonWebServicesCredentials(credentialsId: 'test-id', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
    // Your pipeline steps that require AWS credentials
echo 'Building jenkins script.. .$AWS_ACCESS_KEY_ID $AWS_SECRET_ACCESS_KEY '
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