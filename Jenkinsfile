pipeline {
  agent {
    docker {
      image "bryandollery/terraform-packer-aws-alpine"
      args "-u root --entrypoint=''"
    }
  }

  environment {
    CREDS = credentials('abdul-aws-creds')
    AWS_ACCESS_KEY_ID = "${CREDS_USR}"
    AWS_SECRET_ACCESS_KEY = "${CREDS_PSW}"
    OWNER = 'abdul'
    PROJECT_NAME = 'web-server'
  }

  stages {
    
    stage("destory") {
      steps {
        sh 'time terraform destroy -auto-approve'
      }
    }
    
  }  

}
