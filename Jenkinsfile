pipeline {
    agent any
    // tools {
    //     nodejs'node-16.20.2'
    // }

    environment {
        APP_NAME= "react-example"
        SONARQUBE_SERVER= "sonarqube"
    }

    stages {

        stage('Install dependencies') {
            steps {
                echo " installer les dependances"
                sh 'npm install'
            }
        }
        
        stage('Build') {
            steps {
                echo " Build de l'application"
                sh 'npm run build'
            }
        }

        stage('test') {
            steps {
                echo " Execution des tests "
                sh 'npm test'
            }
        }
        stage('SonarQube Analysis') {
            steps {
                script {
                    // Exécution de l'analyse SonarQube
                    withSonarQubeEnv(SONARQUBE_SERVER) {
                        // Exécution de l'analyse SonarQube avec le scanner pour Node.js
                        sh 'npm run sonar-scanner'
                    }
                }
            }
        }

    }
}
