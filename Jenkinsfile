pipeline {
    agent { dockerfile true }
    stages {
        stage('BuildPhase') {
            steps {
                sh 'docker images'
                              
            }
        }
        stage('CommitPhase') {
            steps {
                sh 'docker push dchandrashaker/18082020_mylab:latest'
                                
            }
        }
    }
}
