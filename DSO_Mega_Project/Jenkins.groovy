pipeline {
    agent any
    
    tools {
        nodejs "nodejs23"
    }
    
    environment{
        SCANNER_HOME = tool "sonar-scanner"
    }
    
    stages {
        stage("Clean WorkSpace"){
            steps{
                cleanWs()
            }
        }
        // Git Checkout
        stage('Git CheckOut') {
            steps {
                git branch: 'main', url: 'https://github.com/jaiswaladi246/3-Tier-DevSecOps-Mega-Project.git'
            }
        }
        // Frontend Compilication
        stage("Frontend Compilcation"){
            steps {
               dir('client') {
                   sh 'find . -name "*.js" -exec node --check {} +'
                }
            }
        }
        // Backend Compilication
        stage("Backend Compilcation"){
            steps {
               dir('api') {
                   sh 'find . -name "*.js" -exec node --check {} +'
                }
            }
        }
        // Check Git leaks
        stage("GitLeaks Scan"){
            steps {
               sh "gitleaks detect --source ./client --exit-code 1"
               sh "gitleaks detect --source ./api --exit-code 1"
            }
        }
        // Sonarqube Analysis
        stage("Sonarqube Analysis"){
            steps {
             withSonarQubeEnv(installationName: 'sonar-scanner') {
                  sh '''
                 $SCANNER_HOME/bin/sonar-scanner \
                -Dsonar.projectName=NodeJS-Project \
                -Dsonar.projectKey=NodeJS-Project
                  '''
              }
         }
    }

stage("Sonarqube Analysis Quality gate Check"){
    steps {
       timeout(time: 10, unit: 'MINUTES') {
           waitForQualityGate abortPipeline: false // credentialsId not needed
        }
    }
}
        // Trivy FS Scan
         stage("Trivy FS Scan"){
            steps {
              sh 'trivy fs --format table -o fs-report.html .'
            }
        }
    }
}