pipeline {
    agent any
    tools {
        nodejs 'nodejs'
    }
    stages {
        stage('Prepare') {
            steps {
                sh 'npm install -g yarn'
                sh 'yarn cache clean'
            }
        }
        stage('install and build') {
            steps {
                echo 'building application'
                sh 'yarn install'
                sh 'yarn build'
                sh 'docker build -t my-react-jenkins .'
                sh 'docker run -d -p 5173:5173 my-react-jenkins'
            }
        }
        stage('deploy dev') {
            when {
                branch 'dev'
            }
            steps {
                echo 'deploy dev'
            }
        }
        stage('deploy production') {
            when {
                branch 'master'
            }
            steps {
                echo 'deploying application'
            }
        }
    }
}