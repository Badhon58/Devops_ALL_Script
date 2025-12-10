// pipeline {
//     agent { label 'build' }
//     environment { 
//         registry = "badhon58/democicd" 
//         registryCredential = 'DockerHub' 
//     }    

//     stages {
//         stage('CheckOut') {
//             steps {
//                 git branch: "main", credentialsId : "GitLabCred", url: 'https://gitlab.com/learndevopseasy1/springboot-build-pipeline.git'
//             }
//         }
//         stage("Stage I : Build"){
//             steps{
//                 sh "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64; mvn clean package "
//             }
//         }
//         stage("Stage II: Code Coverage"){
//             steps{
//                 sh "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64; mvn jacoco:report " 
//             }
//         }
//         stage("Stage III: SCA"){
//             steps{
//                 sh "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64; mvn org.owasp:dependency-check-maven:check"
//             }
//         }
//         stage("Stage IV: SAST"){
//             steps{
//                 withSonarQubeEnv('mysonarqube') {
//                     sh 'mvn sonar:sonar -Dsonar.coverage.jacoco.xmlReportPaths=target/site/jacoco/jacoco.xml -Dsonar.dependencyCheck.jsonReportPath=target/dependency-check-report.json -Dsonar.dependencyCheck.htmlReportPath=target/dependency-check-report.html -Dsonar.projectName=wezvatech'
//                 }
//             }
//         }
//         stage("Stage V: QualityGates"){
//             steps{
//                 script {
//                     timeout(time: 1, unit: 'MINUTES') {
//                     def qg = waitForQualityGate()
//                     if (qg.status != 'OK') {
//                     error "Pipeline aborted due to quality gate failure: ${qg.status}"
//                         }
//                     }
//                 }
//             }
//         }
//         stage('Stage VI: Build Image') {
//             steps { 
//                 script {
//                     docker.withRegistry( '', registryCredential ) { 
//                     myImage = docker.build registry + ":$BUILD_NUMBER" 
//                     myImage.push()
//                     }
//                 }
//             }
//         }

//     }
// }
