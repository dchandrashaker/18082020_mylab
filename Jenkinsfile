pipeline {
    agent { dockerfile true }
    stages {
        stage('BuildPhase') {
            steps {
                sh 'docker build -t volume:v1 .'
                sh 'docker container run --rm -d --name volume-test volume:v1'
                sh 'docker container inspect -f '' volume-test'
            }
        }
    }
}
