pipeline {
    agent any
    environment {
        ENV = "dev"
        ENVFILE=""
    }

    stages {
        stage('Load Environment') {
            steps {
                script {
                    echo "Current Git branch is ${env.GIT_BRANCH}"
                    if (env.GIT_BRANCH == 'origin/main')  {
                        
                        ENV = "prod"
                         echo "inside main if ${env.ENV}"
                    } else if (env.GIT_BRANCH == 'origin/test') {
                        ENV = "qa"
                    } else if (env.GIT_BRANCH == 'origin/develop') {
                        ENV = "dev"
                    }
                    def envFile = ".env.${ENV}"
                  
                    ENVFILE=envFile
                    println "Environment file: ${envFile}"
                }
            }
          
        }
        stage('Build') {
            steps {
                script{
                echo "inside main if ${env.GIT_BRANCH}"
                    echo "inside main if ${env.ENV}"
                }
 withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY',
                    credentialsId: 'test-id'
                ]]) {
                    sh 'echo ${ENVIRONMENT}'
                    sh 'echo $AWS_ACCESS_KEY_ID'
                    sh 'echo $AWS_SECRET_ACCESS_KEY'
                    sh './deploy.sh'
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
