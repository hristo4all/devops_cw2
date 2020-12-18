pipeline {
agent any
tools {nodejs "server.js"}
stages {
   stage('Code Quality Check via SonarQube') {
   steps {
       script {
       def scannerHome = tool 'SonarQube';
           withSonarQubeEnv("SonarQube") {
           sh "${tool("sonarqube")}/bin/sonar-scanner \
           -Dsonar.projectKey=test-node-js \
           -Dsonar.sources=. \
           -Dsonar.css.node=. \
           -Dsonar.host.url=http://3.238.239.24:9000\
           -Dsonar.login=your-generated-token-from-sonarqube-container"
               }
           }
       }
   }
}
}
