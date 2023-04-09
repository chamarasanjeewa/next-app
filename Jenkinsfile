
pipeline {
    agent any
    environment {
        Test=""
    }

    stages {
         stage('Load Environment') {
            steps {
                script {
                    echo "Current Git branch is ${env.GIT_BRANCH}"
                  echo env.BRANCH_NAME
                    if (env.GIT_BRANCH == 'origin/main')  {
                        
                       env.ENV = "prod"
                        println "selected environment is: ${ENV}"
                    } else if (env.GIT_BRANCH == 'origin/test') {
                        env.ENV = "qa"
                    } else if (env.GIT_BRANCH == 'origin/develop') {
                       env. ENV = "dev"
                    }
                    def envFile = ".env.${ENV}"
                    env.ENVFILE=envFile
                    println "selected environment file is: ${env.ENVFILE}"
                }
            }
          
    }
        stage('Build') {
            steps {
                
  withCredentials([
          file(credentialsId: 'env-file', variable: 'ENV_FILE'),
          [
            $class: 'AmazonWebServicesCredentialsBinding',
            accessKeyVariable: 'AWS_ACCESS_KEY_ID',
            secretKeyVariable: 'AWS_SECRET_ACCESS_KEY',
            credentialsId: 'leave-app-s3-bucket-credentials'
          ]
        ]) {
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
