pipeline {
    agent any
    tools {
        nodejs ""
    }

    environment {
        APP_NAME= "react-example"
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
                sh 'npm install'
            }
        }  

    }
}
