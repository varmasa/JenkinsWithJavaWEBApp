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
                withCredentials([
                    string(credentialsId: 'KubernetesToken', variable: 'K8S_TOKEN'),
                    file(credentialsId: 'k8scrt', variable: 'K8S_CA')
                ]) {
            sh '''
            kubectl config set-cluster minikube \
                --server=https://192.168.49.2:8443 \
                --certificate-authority=$K8S_CA \
                --embed-certs=true

            kubectl config set-credentials jenkins \
                --token=$K8S_TOKEN

            kubectl config set-context jenkins \
                --cluster=minikube \
                --user=jenkins

            kubectl config use-context jenkins

            kubectl set image deployment/javawebapp \
                javawebapp=saivarma5557/javawebapp:${VERSION}

            kubectl rollout status deployment/javawebapp

            kubectl get pods
            '''
        }
    }
}
    }
}
