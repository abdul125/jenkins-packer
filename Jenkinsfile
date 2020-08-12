pipeline {
  agent {
    docker {
      image "bryandollery/terraform-packer-aws-alpine"
      args "-u root --entrypoint='' --rm"
    }
  }
  environment {
    CREDS = credentials('abdul-creds')
    AWS_ACCESS_KEY_ID = "${CREDS_USR}"
    AWS_SECRET_ACCESS_KEY = "${CREDS_PSW}"
    OWNER = 'abdul'
    PROJECT_NAME = 'web-server'
  }
  stages {
    stage("build") {
      steps {
        sh 'ls -alht && docker ps -a && which packer'
        sh 'packer build packer.json'
      }
    }
  }  
  post {
    success {
        build quietPeriod: 0, wait: false, job: 'abdul-jenkins-tf'  
    }
  }
}
