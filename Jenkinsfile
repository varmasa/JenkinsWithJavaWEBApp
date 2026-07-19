pipeline {
    agent any
    environment {
        VERSION = "1.0.${BUILD_NUMBER}"
    }
        stage('Maven Build') {
            steps {
                dir('webapp-java') {
                  sh 'mvn clean package'
                }
            }
        }
}
