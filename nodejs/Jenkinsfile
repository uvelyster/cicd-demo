pipeline{
    agent any
    stages{
        stage("checkout"){
            steps{
                checkout scm
            }
        }
        stage("image build"){
            steps{
                script{
                    myapp = docker.build("myregistry.com/root/hello/hello")
                }
            }
        }
        stage("push image"){
            steps{
                script{
                    docker.withRegistry('https://myregistry.com','registry-auth'){
                        myapp.push("latest")
                    }
                }
            }
        }
        stage("deploy"){
            steps{
                sh "kubectl apply -f deploy-app.yml"
            }
        }
    }
}
