pipeline {
    agent any

    environment {
        VERSION = "1.0.${BUILD_NUMBER}"
    }

    stages {

        stage('Git checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/varmasa/JenkinsWithJavaWEBApp.git'
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
                    sh """
                        docker rmi -f \$(docker images -q) || true

                        docker build -t saivarma5557/javawebapp:${VERSION} .
                    """
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockercredID') {
                        sh "docker push saivarma5557/javawebapp:${VERSION}"
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {

                withKubeCredentials([
                    kubernetesCredentials(
                        serverUrl: 'https://192.168.49.2:8443',
                        credentialsId: 'KubernetesToken',
                        caCertificateCredentialsId: 'k8scrt'
                    )
                ]) {

                    sh """
                        kubectl set image deployment/javawebapp \
                        javawebapp=saivarma5557/javawebapp:${VERSION}

                        kubectl rollout status deployment/javawebapp

                        kubectl get pods
                    """
                }
            }
        }
    }
}
