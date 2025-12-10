### CICD Pipeline | DEVSECOPS | Real-World Projects

- DevSecops Build Pipeline Stages Real Time
  -> Build & Unit test -> Code Coverage -> SCA -> SAST -> Quality Gates -> Build Image -> Scan Image -> Smoke Test

---

## Continues Integration

- Stage 1: Build & Unit test

  - Generate Artifacts
  - Unit Test
  - Tools: Maven, NodeJS

- Stage 2: Code Coverage

  - Home Many lines of code you tested ?
  - Unused code
  - Tools: Jacoco

- Stage 3: Software composition analysis

  - Identify Vulnerabilities introduced bu open-source or 3rd parth libraries used in code
  - Tools: Owasp Dependency-Check

- Stage 4: Static Application Security Testing

  - Identify Vulnerabilities in proprietary code
  - Insecure coding practices
  - Tools: Sonarqube

- stage 5: Quality Gates

  - Check if application meets the quality standers
  - Tools: Sonarqube Quality Profile

- Stage 6: Build Docker image

  - Generate Deployable Artifact
  - Tools: Dockerfile

- State 7 : Scan Docker Image

  - Identify Vulnerabilities in Image layers
  - Tools: Trivy

- Stage 8 : Smoke Test
  - Verify if the Image is build Properly
  - Determine If Image/Application is ready for testing
  - Tools: Docker Container

---

# First create 3 server

### First one is Jenkins

```
sudo apt update
sudo apt install fontconfig openjdk-21-jre
java -version
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update
sudo apt install jenkins
systemctl enable jenkins
systemctl start jenkins
systemctl status jenkins
```

### Secound one is SonarQube

```
sudo apt update
sudo apt install -y docker.io
sudo usermod -a -G docker ubuntu
sudo docker run -d --name sonar -p 9000:9000 sonarqube:lts-community
```

### Third one is Build Version

```
#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root or sudo privileges "
  exit 1
fi


# Install Java 8, Java 11, java 21 & Docker
apt update
apt install -y openjdk-8-jdk openjdk-11-jdk openjdk-21-jdk docker.io maven
usermod -a -G docker ubuntu

# Install Trivy
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
apt update
apt install -y trivy

sleep 5; clear
echo "   =================================="
echo "** Your Build server is ready for use **"
echo "   =================================="

```

- After Install Jenkins we need to install some plugin

  - Parameterized trigger plugin
  - Gitlab plugin
  - Docker Pipeline
  - Pipeline: AWS steps
  - SonarQube Scanner
  - Quality Gates

- Add necessary credentials In Jenkins

  - Generate Sonarqube token of type "global analysis token" and add it as Jenkins credential of type "secret text" Then add this mysonarqube into system
  - Add Build server credentials for Jenkins master to connect
  - Add dockerhub credentials as username/password type
  - Add Gitlab credentials

- Enable Sonarqube webhook for Quality Gates & Install dependency-check plugin

  - Generate webhook & add the Jenkins URL as follows - http://URL:8080/sonarqube-webhook/
  - After that Administratration -> MarketPlace -> Dependency Check

- Create A Pipeline

```
environment {
        registry = "gitlabusername/reponame"
        registryCredential = 'DockerHub'
   }
```

---

```
pipeline {
     agent { label 'build' }
        environment {
        registry = "badhon58/democicd"
        registryCredential = 'DockerHub'
   }

    stages {
        stage('CheckOut') {
            steps {
                git branch: "main", credentialsId : "GitLabCred", url: 'https://gitlab.com/learndevopseasy1/springboot-build-pipeline.git'
            }
        }
        stage("Stage I : Build"){
            steps{
                sh "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64; mvn clean package "
            }
        }
        stage("Stage II: Code Coverage"){
            steps{
                sh "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64; mvn jacoco:report "
            }
        }
        stage("Stage III: SCA"){
            steps{
                sh "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64; mvn org.owasp:dependency-check-maven:check"
            }
        }
        stage("Stage IV: SAST"){
            steps{
                withSonarQubeEnv('mysonarqube') {
                    sh 'mvn sonar:sonar -Dsonar.coverage.jacoco.xmlReportPaths=target/site/jacoco/jacoco.xml -Dsonar.dependencyCheck.jsonReportPath=target/dependency-check-report.json -Dsonar.dependencyCheck.htmlReportPath=target/dependency-check-report.html -Dsonar.projectName=wezvatech'
                }
            }
        }
    }
}

```
