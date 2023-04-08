#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
        BRANCH_NAME = "${env.BRANCH_NAME}"
        ENV = "dev"
    }

    stages {
        stage('Load Environment') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'master') {
                        ENV = "prod"
                    } else if (env.BRANCH_NAME == 'test') {
                        ENV = "qa"
                    } else if (env.BRANCH_NAME == 'develop') {
                        ENV = "dev"
                    }
                    def envFile = "env.${ENV}"
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
                sh 'echo ${ENV}' 
                sh 'echo ${GIT_BRANCH}'
                 sh 'echo ${BRANCH_NAME}'
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
