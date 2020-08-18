pipeline { 

    environment { 

        registry = "dchandrashaker/18082020_mylab" 
        registryCredential = 'f8351fba-125a-4e11-9243-d1abce110a55' 
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
