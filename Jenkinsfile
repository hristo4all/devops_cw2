pipeline {
       environment { 
        registry = "hristo4all/cw2" 
        registryCredential = 'docker-hub-credentials' 
        dockerImage = '' 
    }

agent any
tools {nodejs "server.js"}
stages {
        
stage('Checkout') {
       git branch: 'main', credentialsId: 'f7d5e9e4-f086-43a5-98ec-ecd7780e4050', url: 'https://github.com/hristo4all/devops_cw2.git'
   }
        stage('Building our image') { 

            steps { 
                script { 
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
            } 
        }
           stage('Deploy our image') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push() 
                    }
                } 
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
