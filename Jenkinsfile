
pipeline {
    agent any
    environment {
        Test=""
    }

    stages {
        stage('Install Docker Compose') {
    steps {
        sh 'curl -sSL https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose'
    }
}
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
          file(credentialsId: 'env-file', variable: 'FILE_CREDS'),
          [
            $class: 'AmazonWebServicesCredentialsBinding',
            accessKeyVariable: 'AWS_ACCESS_KEY_ID',
            secretKeyVariable: 'AWS_SECRET_ACCESS_KEY',
            credentialsId: 'test-id'
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
