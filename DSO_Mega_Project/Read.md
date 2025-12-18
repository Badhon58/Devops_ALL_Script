# CICD Pipeline

-> git checkout
-> Compilition
-> git leaks
-> FS Scan
-> Unit Testing
-> Sonarqube Analysis
-> Code Quality gates
-> Build Docker Iamge with tag
-> Scan trivy
-> Push the image to the Docker hub/registry

- Ci Pipeline -> Scan is complete and ready to deploy

Docker jenkins and Sonarqube docker container

- docker run -itd --name jenkins -p 8080:8080 jenkins/jenkins:lts
- docker run -itd --name sonarqube -p 9000:9000 sonarqube:lts

**_Depedency Install in jenkins _**

```
apk update
apk add wget tar
wget https://github.com/zricethezav/gitleaks/releases/download/v8.20.1/gitleaks_8.20.1_linux_x64.tar.gz
tar -xvzf gitleaks_8.20.1_linux_x64.tar.gz
mv gitleaks /usr/local/bin/
gitleaks version
apt update
apt install -y wget tar
wget https://github.com/zricethezav/gitleaks/releases/download/v8.20.1/gitleaks_8.20.1_linux_x64.tar.gz
tar -xvzf gitleaks_8.20.1_linux_x64.tar.gz
mv gitleaks /usr/local/bin/
gitleaks version
apt update
apt install -y libatomic1
---
apt-get install wget gnupg
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | tee /usr/share/keyrings/trivy.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb generic main" | tee -a /etc/apt/sources.list.d/trivy.list
apt-get update
apt-get install trivy

---
docker network create devsecops
docker network connect devsecops jenkins
docker network connect devsecops sonarqube
```

**_pipeline Code _**

```
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

```
