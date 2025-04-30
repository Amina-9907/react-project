pipeline {
    agent any
    // tools {
    //     nodejs'node-16.20.2'
    // }

    environment {
        APP_NAME= "react-example"
        SONARQUBE_URL = 'http://192.168.15.115:9000'  
        SONARQUBE_PROJECT_KEY = 'front'
        SONARQUBE_AUTH_TOKEN = credentials('sonar-credential')
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
                    // Exécute l'analyse SonarQube avec la commande sonar-scanner
                    sh """
                        sonar-scanner \
                            -Dsonar.projectKey=$SONARQUBE_PROJECT_KEY \
                            -Dsonar.host.url=$SONARQUBE_URL \
                            -Dsonar.login=$SONARQUBE_AUTH_TOKEN
                    """
                }
            }
        }
    }

}

