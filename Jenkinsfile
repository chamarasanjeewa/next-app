#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
        ENV = "dev"
    }

    stages {
        stage('Load Environment') {
            steps {
                script {
                    echo "Current Git branch is ${env.GIT_BRANCH}"
                    if (env.GIT_BRANCH == 'origin/main')  {
                         echo "inside main if ${env.GIT_BRANCH}"
                        env.ENV = "prod"
                    } else if (env.GIT_BRANCH == 'origin/test') {
                        env.ENV = "qa"
                    } else if (env.GIT_BRANCH == 'origin/develop') {
                        env.ENV = "dev"
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
                scripts{
                echo "inside main if ${env.GIT_BRANCH}"
                    echo "inside main if ${env.ENV}"
                }
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
