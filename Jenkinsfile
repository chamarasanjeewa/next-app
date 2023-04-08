#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
        ENVIRONMENT =((GIT_BRANCH == 'origin/test') ? 'qa' : (GIT_BRANCH == 'origin/master') ? 'production' : 'none')
    }

    stages {
        stage('Load Environment') {
            steps {
                script {
                    def envFile = "env.${ENVIRONMENT}"
                    if (fileExists(envFile)) {
                        envVars = readProperties file: envFile
                        envVars.each { key, value ->
                            env[key] = value
                        }
                    }
                }
            }
        }
        stage('Build') {
            steps {
                sh 'echo ${ENVIRONMENT}' 
                sh 'echo ${GIT_BRANCH}'
                 sh 'echo ${ENVIRONMENT}'
//  withCredentials([[
//                     $class: 'AmazonWebServicesCredentialsBinding',
//                     accessKeyVariable: 'AWS_ACCESS_KEY_ID',
//                     secretKeyVariable: 'AWS_SECRET_ACCESS_KEY',
//                     credentialsId: 'leave-app-s3-bucket-credentials'
//                 ]]) {
//                     sh 'echo ${ENVIRONMENT}'
//                     sh 'echo $AWS_ACCESS_KEY_ID'
//                     sh 'echo $AWS_SECRET_ACCESS_KEY'
//                     sh './deploy.sh'
//                 }

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
