pipeline {
  agent any

  parameters {
            string(name: 'VERSION', defaultValue: '1.0.0', description: 'The version number for the build')
            string(name: 'BRANCH', defaultValue: 'develop', description: 'The branch for the build')
            string(name: 'ENVIRONMENT', defaultValue: 'DEV', description: 'The branch for the build')
        }

  environment {
    IMAGE_NAME = "nodejsapp"
    REGISTRY = "anuragdhiman400"
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: "${BRANCH}", url: 'https://github.com/Anurag-Devops2024/NodeJs_code.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
            sh  "docker build -t ${REGISTRY}/${IMAGE_NAME}:${VERSION}-${ENVIRONMENT} ."
        }
      }
    }

    stage('Push to Registry') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'docker_hub_cred', usernameVariable: 'DOCKER_USER' , passwordVariable: 'DOCKER_PASSWORD')]) {
          sh "docker login -u ${DOCKER_USER} -p ${DOCKER_PASSWORD}"
          sh "docker push ${REGISTRY}/${IMAGE_NAME}:${VERSION}-${ENVIRONMENT}"
        }
      }
    }

    stage('Deploy to Environment') {
      steps {
        script {
          echo "Deploying to DEV environment..."
          // Replace with kubectl/compose deployment command as needed
        }
      }
    }
  }
}