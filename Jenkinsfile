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
                        println "selected environment is: ${ENV}"
                    } else if (env.GIT_BRANCH == 'origin/test') {
                        ENV = "qa"
                    } else if (env.GIT_BRANCH == 'origin/develop') {
                        ENV = "dev"
                    }
                    def envFile = ".env.${ENV}"
                  
                    ENVFILE=envFile
                    println "selected environment file is: ${ENVFILE}"
                   
                }
            }
          
        }
        stage('Build') {
            steps {
                script{
                echo "inside build script..... ${env.GIT_BRANCH}"
                    echo "environment selected.... ${env.ENV}"
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
      sh '''
          # Access the value of MY_VAR
          echo "The value of MY_VAR is: $MY_VAR"
        '''
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
