@Library('devops-library') _

pipeline {

    agent any
    
    environment {
        VERSION = "1.0.${BUILD_NUMBER}"
    }
    stages {

        stage('Checkout') {
        stage('Git checkout') {
            steps {
                checkout scm
                git branch: 'main', url: 'https://github.com/varmasa/JenkinsWithJavaWEBApp.git'
            }
        }

        stage('Build') {
        stage('Maven Build') {
            steps {
                buildJava("webapp-java/pom.xml")
                dir('webapp-java') {
                  sh 'mvn clean package'
                }
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
