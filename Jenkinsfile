pipeline{
  agent any
  stages {
    stage("build"){
      steps{
          echo 'building the application...'
        }
    }
    stage("test"){
      steps{
          echo 'testing the application...'
        }
    }
    stage("deploy"){
      steps{
          echo 'deploying the application...'
        }
    }
stage('Code Quality Check via SonarQube') {
   steps {
       script {
       def scannerHome = tool 'sonarqube';
           withSonarQubeEnv("sonarqube-container") {
           sh "${tool("sonarqube")}/bin/sonar-scanner \
           -Dsonar.projectKey=test-node-js \
           -Dsonar.sources=. \
           -Dsonar.css.node=. \
           -Dsonar.host.url=http://3.238.239.24:9000 \
           -Dsonar.login=47e7c5e838953d9b3faf409ae4dcaaeb61b8f9d8"
               }
           }
       }
}
  stage("Install Project Dependencies") {
   steps {
       nodejs(nodeJSInstallationName: 'nodenv'){
           sh "npm install"
           }
       }
   }
}
  }
}
