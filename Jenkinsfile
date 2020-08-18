pipeline { 

    environment { 
        stage('Initialize'){
        def dockerHome = tool 'docker'
        env.PATH = "${dockerHome}/bin:${env.PATH}"
    }

        registry = "dchandrashaker/18082020_mylab" 
        registryCredential = 'dchandrashaker' 
        dockerImage = '' 
    }

   agent { dockerfile true }

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
