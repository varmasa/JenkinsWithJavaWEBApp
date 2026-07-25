@Library('devops-library') _

pipeline {

    agent any
    
    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                buildMaven("webapp-java/pom.xml")
            }
        }
    }

    post {
        success {
            echo "Build Successful"
        }

        failure {
            echo "Build Failed"
        }
    }
}
