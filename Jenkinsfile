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
       steps{
       git branch: 'main', credentialsId: 'f7d5e9e4-f086-43a5-98ec-ecd7780e4050', url: 'https://github.com/hristo4all/devops_cw2.git'
       }
       
   }
        stage('Building Image') { 

            steps { 
                script { 
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
            } 
        }
           stage('Deploy Image') { 
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
           -Dsonar.projectKey=test-server-js \
           -Dsonar.sources=.\
           -Dsonar.host.url=http://3.236.97.199:9000/ \
           -Dsonar.login=11e96d88f51f7712dd890028ae9f5040f3b5256f"
               }
           }
       }
   
}
}
}
