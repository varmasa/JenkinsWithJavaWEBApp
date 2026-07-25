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
       stage('Dockerbuild') {
           steps {
               dir('webapp-java'){
               sh 'docker build -t saivarma5557/javawebapp:"${VERSION}" .'
               sh 'docker run -itd --name hello-webapp -p 8085:8085 saivarma5557/javawebapp:"${VERSION}"'
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
