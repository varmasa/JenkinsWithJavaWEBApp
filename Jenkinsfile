pipeline {
    agent any
    environment {
        VERSION = "1.0.${BUILD_NUMBER}"
    }
    stages {
        stage('Git checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/varmasa/JenkinsWithJavaWEBApp.git'
            }
        }
        stage('Maven Build') {
            steps {
                dir('webapp-java') {
                  sh 'mvn clean package'
                }
            }
        }
       stage('Docker Build') {
            steps {
                dir('webapp-java') {
                    sh '''
                    # Stop and remove old container if it exists
                    docker rm -f hello-webapp || true

                    # Remove old image if it exists
                    docker rmi -f saivarma5557/javawebapp:${VERSION} || true

                    # Build new image
                    docker build -t saivarma5557/javawebapp:${VERSION} .

                    # Run new container
                    docker run -d \
                      --name hello-webapp \
                      -p 8085:8085 \
                      saivarma5557/javawebapp:${VERSION}
                    '''
                }
            }
        }
      stage('Push to Docker Hub') {
          steps {
             script {
                 docker.withRegistry('https://index.docker.io/v1/', 'dockercredID') {
                         sh 'docker push saivarma5557/javawebapp:"${VERSION}"'
                 }
             }
          }
      }
   }
}
