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
    stage('Sonarqube') {
    environment {
        scannerHome = tool 'SonarQubeScanner'
    }
    steps {
        withSonarQubeEnv('sonarqube') {
            sh "${scannerHome}/bin/sonar-scanner"
        }
        timeout(time: 10, unit: 'MINUTES') {
            waitForQualityGate abortPipeline: true
        }
    }
}
  }
}
