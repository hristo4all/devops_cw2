pipeline {
agent any
tools {nodejs "server.js"}
stages {
   stage('Code Quality Check via SonarQube') {
   steps {
       script {
       def scannerHome = tool 'SonarQube';
           withSonarQubeEnv("SonarQube") {
           sh "${tool("SonarQube")}/bin/sonar-scanner \
           -Dsonar.projectKey=test-node-js \
           -Dsonar.sources= .\
           -Dsonar.host.url=http://3.238.239.24:9000 \
           -Dsonar.login=47e7c5e838953d9b3faf409ae4dcaaeb61b8f9d8"
               }
           }
       }
   }
}
}
