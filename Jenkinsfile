pipeline {
    
    environment{
        BUILD_NUM_ENV = currentBuild.getNumber()
        ANOTHER_ENV = "${currentBuild.getNumber()}"
    }
    
    agent any
    
    tools {
        maven '3.8.5'
    }
    
    stages{
        
        stage("Build Maven Project"){
            steps{
                
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: '07167a61-baef-4493-9346-7cde00a096fb', name: 'Bibek', url: 'https://github.com/bborah/rest-service.git']]])
                sh "mvn clean install"
            }
        }
        
        stage ("Build Docker Image"){
            steps{
                script{
                    sh 'docker build -t bibek2017/spring-aks-test:${BUILD_NUM_ENV} .'
                }
            }
        }
        
        stage ("Push to docker Hub"){
            steps{
                script{
                    withCredentials([string(credentialsId: 'b4cf459b-d3f2-4a85-8a05-5ead534238ac', variable: 'docker_hub_pwd')]) {
                        sh 'docker login -u bibek2017 -p London_Jan_2022'
                    }
                    sh 'docker push bibek2017/spring-aks-test:${BUILD_NUM_ENV}'
                }
            }
        }
        stage("install Azure Cli"){
            steps{
                script{
                    sh 'curl -sL https://aka.ms/InstallAzureCLIDeb | bash'
                }
            }
        }
        
        stage("install Kubectl"){
            steps{
                script{
                    sh 'curl -LO https://dl.k8s.io/release/v1.25.0/bin/linux/amd64/kubectl'
                    sh 'chmod +x ./kubectl'
                    sh 'mv ./kubectl /usr/local/bin'
                }
            }
        }
        
        stage('Deploy to ACS'){
            steps{
                withCredentials([azureServicePrincipal('2a6b8672-064e-4f72-b6de-63d83d6c6879')]) {
                sh 'echo "logging in" '
                sh 'az login --service-principal -u c98135b1-fe85-4d9e-9004-3c1e106a5175 -p NrE8Q~n82tZ9ni4KeyalZDO9dOMYyUj4eyt4IbGj -t 88f638f1-78aa-4285-b623-26c2cae5b485'
                sh 'az account set --subscription 1f667ecd-bb3a-4c27-b440-fd7f675c513b'
                sh 'az aks get-credentials --resource-group aks-rg1 --name aks-demo1'
                sh 'kubectl apply -f restApiPod-deployment.yml'
                sh 'kubectl apply -f restApiPod-service.yml'
                }
            }
        }        
        
    }
    
}