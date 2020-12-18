pipeline {
agent any
tools {nodejs "server.js"}
stages {
       stage('Build image') {
          steps{
                         /* This builds the actual image; synonymous to
         * docker build on the command line */
             app = docker.build("hristo4all@abv.bg/cw2")      
          }
         }
       stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
   stage('Code Quality Check via SonarQube') {
   steps {
       script {
       def scannerHome = tool 'SonarQube';
           withSonarQubeEnv("SonarQube") {
           sh "${tool("SonarQube")}/bin/sonar-scanner \
           -Dsonar.projectKey=test-node-js \
           -Dsonar.sources=.\
           -Dsonar.host.url=http://3.238.239.24:9000 \
           -Dsonar.login=47e7c5e838953d9b3faf409ae4dcaaeb61b8f9d8"
               }
           }
       }
   }
}
}
