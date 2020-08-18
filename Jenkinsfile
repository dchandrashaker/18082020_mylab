pipeline { 

    environment { 

        registry = "dchandrashaker/18082020_mylab" 
        registryCredential = '8c92d1b5-56df-468d-b1e2-a326aa1986d1' 
        dockerImage = '' 
    }


   agent any 
    stages { 
        stage('Cloning our Git') { 
            steps { 
                git 'https://github.com/dchandrashaker/18082020_mylab.git' 
            }
        } 
        stage('Building our image') { 
            steps { 
                script { 
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
            } 
        }
        stage('Deploy our image') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push() 
                    }
                } 
            }
        } 

        stage('Cleaning up') { 
            steps { 
                sh "docker rmi $registry:$BUILD_NUMBER" 
            }
        } 
    }
}
