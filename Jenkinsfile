pipeline {
  agent any

  parameters {
            string(name: 'VERSION', defaultValue: '1.0.0', description: 'The version number for the build')
        }

  environment {
    IMAGE_NAME = "nodejsapp"
    REGISTRY = "anuragdhiman400"
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: 'develop', url: 'https://github.com/Anurag-Devops2024/NodeJs_code.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
            sh  "docker build -t ${REGISTRY}/${IMAGE_NAME}:${version} ."
        }
      }
    }

    stage('Push to Registry') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'docker_hub_cred', usernameVariable: 'DOCKER_USER' , passwordVariable: 'DOCKER_PASSWORD')]) {
          sh "docker login -u ${DOCKER_USER} -p ${DOCKER_PASSWORD}"
          sh "docker push ${REGISTRY}/${IMAGE_NAME}:${version}"
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