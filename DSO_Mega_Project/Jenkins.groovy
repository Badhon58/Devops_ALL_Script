// pipeline {
//     agent any
    
//     tools {
//         nodejs "nodejs23"
//     }
    
//     environment{
//         SCANNER_HOME = tool "sonar-scanner"
//     }
    
//     stages {
//         stage("Clean WorkSpace"){
//             steps{
//                 cleanWs()
//             }
//         }
//         // Git Checkout
//         stage('Git CheckOut') {
//             steps {
//                 git branch: 'main', url: 'https://github.com/jaiswaladi246/3-Tier-DevSecOps-Mega-Project.git'
//             }
//         }
//         // Frontend Compilication
//         stage("Frontend Compilcation"){
//             steps {
//                dir('client') {
//                    sh 'find . -name "*.js" -exec node --check {} +'
//                 }
//             }
//         }
//         // Backend Compilication
//         stage("Backend Compilcation"){
//             steps {
//                dir('api') {
//                    sh 'find . -name "*.js" -exec node --check {} +'
//                 }
//             }
//         }
//         // Check Git leaks
//         stage("GitLeaks Scan"){
//             steps {
//                sh "gitleaks detect --source ./client --exit-code 1"
//                sh "gitleaks detect --source ./api --exit-code 1"
//             }
//         }
//         // Sonarqube Analysis
//         stage("Sonarqube Analysis"){
//             steps {
//              withSonarQubeEnv(installationName: 'sonar-scanner') {
//                   sh '''
//                  $SCANNER_HOME/bin/sonar-scanner \
//                 -Dsonar.projectName=NodeJS-Project \
//                 -Dsonar.projectKey=NodeJS-Project
//                   '''
//               }
//          }
//     }

// stage("Sonarqube Analysis Quality gate Check"){
//     steps {
//        timeout(time: 10, unit: 'MINUTES') {
//            waitForQualityGate abortPipeline: false // credentialsId not needed
//         }
//     }
// }
//         // Trivy FS Scan
//          stage("Trivy FS Scan"){
//             steps {
//               sh 'trivy fs --format table -o fs-report.html .'
//             }
//         }
//     }
// }


pipeline {
    agent any
    tools {
        nodejs 'nodejs'
    }
    environment {
        EC2_IP = '16.16.169.229'
    }
    stages {
        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }
        stage('Git Checkout') {
            steps {
                git branch: 'kubs', url: 'https://github.com/Badhon112/jobPortal.git'
            }
        }
        stage('Update Environment Files') {
            steps {
                // Update backend .env file with correct MongoDB URL
                sh '''
                cat > backend/.env << 'EOF'
                PORT=5000
                DBURL=mongodb://admin:badhon@mongo:27017/jobportal?authSource=admin
                SECRET_KEY=BadhonBiswas
                EOF
                '''

                // Update frontend .env file with EC2 IP
                sh '''
                cat > frontend/.env << 'EOF'
                NEXT_PUBLIC_API_URL=http://13.233.121.189:5000/api
                EOF
                '''
            }
        }
        stage('Frontend Compilation') {
            steps {
                dir('frontend') {
                    sh 'find . -name "*.ts" -exec node --check {} +'
                }
            }
        }
        stage('Backend Compilation') {
            steps {
                dir('backend') {
                    sh 'find . -name "*.ts" -exec node --check {} +'
                }
            }
        }
        stage('GitLeaks Scan') {
            steps {
                sh 'gitleaks detect --source ./frontend --report-format json --report-path gitleaks-report.json || true'
                sh 'gitleaks detect --source ./backend --report-format json --report-path gitleaks-report.json || true'
            }
        }
        // stage('SonarQube Analysis') {
        //     steps {
        //         withSonarQubeEnv('sonar-scanner') {
        //             sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=NodeJS-Project \
        //                     -Dsonar.projectKey=NodeJS-Project '''
        //         }
        //     }
        // }
        // stage('Quality Gate Check') {
        //     steps {
        //         timeout(time: 1, unit: 'HOURS') {
        //             waitForQualityGate abortPipeline: false, credentialsId: 'sonar-scanner'
        //         }
        //     }
        // }
        stage('Docker compose build') {
            steps {
                sh 'docker compose build'
            }
        }
        stage('Docker compose Up') {
            steps {
                sh 'docker compose up -d'
            }
        }
    }
}
